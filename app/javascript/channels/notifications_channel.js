import { CableReady } from 'stimulus-use'
import consumer from '../channels/consumer'

consumer.subscriptions.create('NotificationChannel', {
  received(data) {
    if (data.cableReady) CableReady.perform(data.operations)
  }
})
