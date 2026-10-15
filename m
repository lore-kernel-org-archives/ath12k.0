Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99B4CC6B34
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 11:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/nReelf14EWQqHsOcbF+fu+5vGYBDoHE2O0C1m+MiU=; b=Q8Nrz0XEYLtJT+Hh+475IdIZOU
	zUvNrg9qcE6Nq5D4BibXMF6HUmLhg0bFsLh6dQPBt5/skUFzWzsadLuDKFg0T1Y3kWnDAWim4JrWo
	yXOO+QCLciSwLHFvG20F1uN3Ic3tkCGlN5vqyThoL0U35Jl2AjpZkGCbyEpBN5hIhfTRs+1A+98WB
	KHXt6i5uUsRHtQD2/773BbXRqxCYYW82cqYsaji+M7Dww6ZG3fy/svQeJNunDSJWQVAjPO56R+W3A
	QbWojNfp9VmW7WclCVjxRu+AnhBK97SmNwvBwOnIpPBXFb6xI8ku6z2fXOECLmwtqFCKUDuCI5GXf
	hoWXmOYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHK7o-000000002bt-1pb4;
	Thu, 15 Oct 2026 11:59:56 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHK7l-000000002bW-2x0t
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 11:59:54 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2038661a12.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 04:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792065592; cv=none;
        d=google.com; s=arc-20260327;
        b=jxSqRhmSPDdK0sGCZyoJjYkczCEPWTw9Nu46MlGSZC36s+aXmjmR66A+HMdV4heHQ1
         4wRIvyzNQN7m6yDdBL1Vu0NO761wb4RMJfssm1pG4hQEt9DevGK7wUBbZHugHkgHmr4T
         Mn+sIaQoHMA3/uiN4bzEx/h3ikLKzXFfHOACFCPpwJviLIdvABlrTAQZ+lNmMRS/vaWU
         7XOz0gucQHgojwKhDjtF1mUJNUMWS6vPiineXwKnprJ9t/lg1C47LQM3o5GydoL5rBnU
         RpnSAemuS9AVFKpT+9AEIqSpQrMw2jRaR6Dn6DKEUF/lPSN4tvsK3D0QhguMhUyuzOoI
         mXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3/nReelf14EWQqHsOcbF+fu+5vGYBDoHE2O0C1m+MiU=;
        fh=InP8ZgxEyPw9Hohwr/lJKfEKSYLCI3a5eP6n8bhGvoQ=;
        b=MQONTe5RvI/36JHFRQnJfPC9F1KZlH0fXzx3Pim03V9Kk3uyB6Q25jWLu2vViVE3Y5
         npHp8ySTFE+l7QN6ibbQ0ZCVr1+WkfS5pUY9Ui7UDKvd2BS1WOdhAPAKuJASk3wmQ3kS
         JB4L9F22V8BZPtTJFMND8UafrF/JTEcZY3kdqCb06ALuo7Tyy28j+8gu5yFcFlzo3zdD
         wtIXf3+Xs5JHDcwoQEPQbACnz0jazo+JA4ZYfMBAXsBKwxxLwDwCORBzqs96VwAVE8W3
         HNf1jnblqhH5QjVTv1iyECSlXjpYO2kKwFdjRmQqKCc29XUJyK9NG3N89N0Zp3qh+Snw
         6UrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792065592; x=1792670392; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/nReelf14EWQqHsOcbF+fu+5vGYBDoHE2O0C1m+MiU=;
        b=Q7phYXIuI2zfk8rNVNaUsle3+C7o4rarf8KKqatjMHRA4yeIqA8Qy7iY/bZlwWrLLm
         OQR5syvNYoAGo+CsnBvHO0brVeZMK4cpiMWLAiWUhfeaACcFK2KOEi1bLHQLwx1c+a3k
         i39HtJvcOCSBy5nNUWTm4WkTh7RXZavOOgqzgPqI/O9Zz1K2UBzKUk4FBzGYng2E5hzQ
         5MYyJRHlt07BNYupQ2nv0S17AnPorJluqAtCHQ+x6z8aBccbF4gAM0I6GHQu2YZRhh5p
         4QklG82Yam2etH+cemmNLnFyEeyDF4tp71t/uKa4wDP6AEz+8WLEyhPsCdyRQ8i9f9BB
         8RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065592; x=1792670392;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3/nReelf14EWQqHsOcbF+fu+5vGYBDoHE2O0C1m+MiU=;
        b=kTfvIFoI/bYT0c4sKWSq1TClkoCtAxyBaPF2M9AlColx+7Qsotpm2uym4iB6g5p0s3
         JuuM1RV2wnTMadT5Dr6IKkZZnXD38WmavD4habV59JVPNm9a98QohzDGFe7UWaUnU3qW
         Sng8I63kg/rs62VLEsuBteGT+pD+WaqMZkqxo3/ypbqdYsAfFy+RODK2OvhNMKldcog0
         4MSCnY6KBZvUTWq1V6XJQc8BFDrRWoSQ7W61zMuFIUxgZb5ZZBMAfm/wqR87EnOe0mYG
         HuvLIydZI8GroPbUsDIl7ybg341P7US5YY5cZ/9oVTxQWz/guGKNek7IUOJi0aI+cVpi
         FMBA==
X-Gm-Message-State: AFq9FYI5NP4p8uVUajm/Vcl4JA6nA4a5twhbfOl0tI2SdDHg3BCtJYDs
	sJT8Lp3eDPEtKn9H+ZML5F7RLEbsvz5cgLO+lgHzflKZegZ5eNEUd+0ZN7lZwXTHQ8wgF+eFZ4A
	DSEFdTzsuCbCJcmzZRH5AiGy1ApHmKMrodSbTVmg=
X-Gm-Gg: AYBFou2hbyolX/tUvbQYLD8EvTLUP1HI8jM1loVdpfP66LOs2eZDHk8ooBdOvG/diOK
	HZiqStXuzV1iTHtdTLJBE9GKjQSHvSv6EvWyUt64ZwI6kqgq+GnCbJnfXbIBktaVaQ8YCYFC5wi
	03bJaEpQGbHYoGexHbzxbDV0UOK0B7+pG7xL4A0uZ44SXbCBaU61kpfCFb4/U7TLpxObJkQj2ku
	64Pe8dF6PdWG8sJZ0hSclJ0TPY7Xw1Iby4aOyINO/vBNHvCo8i3PuYYersFTKz24SfqsZcMBEHS
	n+tSC0sKzX/t2Ux3VsAF6rwNuF+ev31qtNudpi70Oo73crjPW0mZaEA+6SeBrkK8g9YoP/vZilv
	tjX8AUvXUKThoC/pgCGutVYO4e9EDUvr0y8HslWg=
X-Received: by 2002:a05:6a21:3a42:b0:3cd:8bba:824f with SMTP id
 adf61e73a8af0-3e16baa4738mr17749367637.4.1792065592409; Thu, 15 Oct 2026
 04:59:52 -0700 (PDT)
MIME-Version: 1.0
From: Enrico <vovkap97@gmail.com>
Date: Thu, 15 Oct 2026 13:59:41 +0200
X-Gm-Features: AclHuK_1loIYtjP2yiGN8XJ9aUDF0ZR1Aguu7iHehBX8Ni8AvgjegcgRYd573T4
Message-ID: <CAGHkXsZX7Tnze+rqJY=D5Zz2Vo=t2Hee28pDxFpoE+Lno+EcxA@mail.gmail.com>
Subject: [BUG] ath12k: WCN7850 firmware stops uplink TX on EHT (CMD_REMOVE_AGED_FRAMES)
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_045953_744829_714107A6 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi,

On EHT, the WCN7850 firmware stops transmitting uplink data for 1-4
minutes while the association stays up. The driver keeps handing it
frames, the firmware releases them as CMD_REMOVE_AGED_FRAMES, and the
AP receives only the few frames the firmware reports as acked.
Downlink keeps working and the kernel logs nothing. I saw 11 stalls
in 57 hours on EHT and 0 in 24 hours after switching the AP's 5 GHz
radio to 802.11ax.

Setup:
- Client: Framework laptop, WCN785x [17cb:1107] rev 01,
  subsystem 1eac:8000, ath12k_wifi7_pci
- Kernel: 7.2.7
- Firmware: WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
  (fw_version 0x1103006c, latest in linux-firmware)
- AP: TP-Link EAP770(EU) v1.0 (IPQ9574), firmware 1.0.0, channel 36,
  80 MHz, WPA/WPA2-PSK with TKIP group cipher
- Link: EHT-MCS 12, 80 MHz, 2 NSS, no MLO, signal -31 to -38 dBm
  at the client

Client side, sampled every 2 s with bpftrace (ath12k_wifi7_mac_op_tx
calls, ar->dp.num_tx_pending, deltas of
ath12k_dp.device_stats.tqm_rel_reason):

During a stall the firmware acks only 7-15% of the frames enqueued
and num_tx_pending grows to 1616-4360 (the 9 stalls recorded with
bpftrace). Frames come back in batches as CMD_REMOVE_AGED_FRAMES and
some as CMD_REMOVE_MPDU. At the end the whole queue completes within
2 s.
Sums from stall start to recovery for the 4 stalls recorded with the
release counters (FRAME_ACKED includes the recovery burst):

  stall start        enqueued  FRAME_ACKED  AGED_FRAMES  REMOVE_MPDU
  10-13 22:19:13        20546         9916        10630            6
  10-14 01:28:35        28114         8799        19219           94
  10-14 03:16:57        27658         8811        17770         1075
  10-14 12:14:35        43663        17485        23012         3146

mac80211 and cfg80211 tracepoints show no flush, queue stop, sta
state change, beacon loss or connection loss in any of the 9 stalls.
The only events inside the stalls are scans: 5 of the 9 contain one
or two back-to-back 8-9 s scans, 4 contain none.

AP side, per-station counters (apstats -s -m <client MAC>) every 2 s
during the stall from 2026-10-14 12:14:35 to 12:17:36:

  time      AP rx data  AP tx data/ok  client FRAME_ACKED/AGED
  12:14:01         +48        +44/+44  87/0
  12:15:05          +0        +19/+19  0/224
  12:17:30          +0        +22/+22  0/993 at 12:17:31, pending 1990
  12:17:36       +3273    +2399/+2398  15033/0 at 12:17:37, pending 1
  12:17:38      +12498    +9273/+9268

From 12:14:41 to 12:17:34, in 61 of 87 samples the AP receives no
data from the client. The
other 26 show 1-213 frames, and each matches a FRAME_ACKED batch on
the client in the same 2 s. The AP's TxSuccessDataPackets stays
within 1 of TxDataPackets in every sample.

802.11ax: the client links at HE-MCS 11, 2 NSS, 80 MHz. Over 24
hours CMD_REMOVE_AGED_FRAMES stayed at 0 out of 3.42M frames
enqueued.

I can send the full logs and the bpftrace script, and test firmware
builds or patches.

Thanks,
Vladimir

