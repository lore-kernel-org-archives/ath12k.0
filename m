Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E917C606A334
	for <ath12k@archiver.kernel.org>; Sat, 14 Nov 2026 03:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4vVI+L1Z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VR0jK6EA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jwB/23jRHhcsHV0wrCuIYDgqv/rmgRn7H8RU3sd+R6Q=; b=4vVI+L1Zh0lVLWx4AywkgilSq6
	Nl1KA/RzhWMWWhL6m9UtPJrMaKSWS8CuKjXckjLymh6HuwEsDjgJmmI+vYKy/lnyjptxBkuNq6UAU
	plEI9GjkDsOZGWVTV252XyJkxRFC3DW/10ho80jxj+lJK+6o4/JFTaY9ANOg20bHV+1hpHhswO7tq
	vBvR6VdJmIy8YdeEOar8Y99kS4j6vMrkxPKGLwOGI1+bLGxpmHQakv39DlEliI4O5ET+c9ND8TMGj
	l8yra+FeYhDeEygbsZ4Lv8sw4vmSkbzFxGobH/1jU1PqhAq7bEHY3/xz/eLnLwZsa+qUTKH1TGFS6
	BuW7ujCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Tb-0000000FHBK-15HX;
	Sat, 14 Nov 2026 03:30:51 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4TZ-0000000FHAP-1fKB
	for ath12k@lists.infradead.org;
	Sat, 14 Nov 2026 03:30:50 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-7d2da1667b2so2131688137.2
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 19:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794627047; cv=none;
        d=google.com; s=arc-20260327;
        b=FMKupKaF2SHtaKRvTrfUfPUC84uRW1Yy23KvjRg9MhO8XtF4XwtOXGLsfK2QrwYzAn
         +NhR/g0kqPaNUFSkFt0ck/BNQZrsa/WYZJxVnP2qbRprHokokXTXY/WVEXx8kBeb9tg9
         6IhOPAjBrtcJta1y55Rcy6GfDbHJ0tjREMV3iBKS7TxDeBPrgYadiDlned5u499LLKGF
         UEXx7C2It0InYfbvb1Bi3u2uvkiCQLTZH/oRmlYAJoMJ0MLcUqu97E/VVqDvUbQa2JJs
         /lPjp3ukR93qrrDy0swaPUvc9s22+f/bwi1gW/ZiIFvxtxPW+v+viksqJLToTModMlQN
         /0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jwB/23jRHhcsHV0wrCuIYDgqv/rmgRn7H8RU3sd+R6Q=;
        fh=unOd+iR/s4g3ccNRscfqoIvCvfbfQt24cpkffWnNbx8=;
        b=Y45QjbArAPnK28CAor1LJd1dCH4WISbA+eHdgxaiBFIKwSB730d39lgV/FZD6CupZC
         vMzTCBMw4ZaslQVpYgIvjXTDsUt6YqF1dshrpBUcd8BpbchsjgiO/CE7RnsRyFZtDRFh
         ZOajIrgWN90J5GTMr8Mve5Fvk+BYnLlscQhq6SN7RuTeb0tUAQJzztzQacPCOWhah/ja
         YtqQE/ahlr64R44ZdAT3Ac60os3N2jnhIFPBjOGo+0BB1Sv5wGPGC13UnfSG2X5IKvtC
         KD/ggAIrzODevf05b3okzC61aoz+kkPw8THDnCyNKD1+tPmo1gwzQGVCXM6hzgFzd2EA
         gAQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794627047; x=1795231847; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwB/23jRHhcsHV0wrCuIYDgqv/rmgRn7H8RU3sd+R6Q=;
        b=VR0jK6EATIPFD64QyweMoIpFZQ04tugJQzWnrxB8u1DifCsrdua3F7/EEzCnJhQSA5
         Z/CigtHhna7C56p5SMXdEBCsHUoAEcjbJkL0fI2GMLWiIJwb8V8zRaqzM9BQ6XOwoCIO
         TZXCzQM/4+2jo6UL0/BnwCEMC18T6FJLAe3Oi+UZQpmJvftzIJUfJuQO3xyre4q21AtY
         15HW/YHMnTlbb2rz51oijnKspS3MG7xT5u0JVSvjbTIGYFNuWVx5a6D0LodK4A4CFWMg
         FHSAY4dW+qSkO0/ZVumaZZj4a2YXQuYQqs9XVCQyMt2S9FNb7ZYyw0F8Y91kMvppEjP+
         SRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627047; x=1795231847;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jwB/23jRHhcsHV0wrCuIYDgqv/rmgRn7H8RU3sd+R6Q=;
        b=Ff8/Dp+aaLbCuUIfXFpz4fY0AEBYv8j/jWPMdLUqD822gyWWWH2zFsY+Fbw5GX0/nr
         vIbmUyVyy2aCXqvvZ90bH5XCmeHl+SxhlnQ+zYl7Aern74y0EdEF9wc2/i5lXqIIT+eM
         pJD0IHHAQ/fee69Qa3rSzryQNsykNFkWX0lhF6DKKZ9+NB2YV+/9tdnVxZCdkNPOCjqE
         1hnWOqG47as1XIyvgjyBOMTr7OP3PhLHQPqdrqyhmmjN3KDCJdDzABprFcPdkQkeY+V1
         RwWLbZuDfsbJXpK0HkqiM+ZcYhpfRoJqgPWqG50jbIvKaBcLAgk7Pf2wqq0ZMP2HPzP7
         26vA==
X-Gm-Message-State: APuU4Z/55BbNvlVHOVOyzdWxv5hFLVvzA6VAxfVDzGOZmLOvXgfDasvg
	ok92DYa6Y7PhRRh1Oel8WARM0d+njrBknHLv04Kdh4l6autekawEfvb1c2eZ7462LmUciprjmrl
	1lUwRCaAx16LZq2GndEcyb5rDEvMKiMOkmnrz
X-Gm-Gg: AYBFou1uQ5hNj2LaEWCDNVxJcNBFDVGeQk+XIzZwdGKXly+rmOJElMU+OuGFGWUDqUf
	IyeslD70SAQdjJ2ie4Pe/j8YL0LU6JdyVtFUt/kI5fFJGOoHh+hE0emR0CsaxTOsCC1ewqdUbYs
	RNJyoy8vQuJhKxFmeH4vhWAlJEsBQRHyRHN7pSaKA2+iH19uwlKls0E9hhXIfktE8U+cFfOrDUT
	Iqj7oENifcUj1LoxvrpglpB25GTqDpcArpUspL4oQSuL50/tfpdgYHjDftm/VCnoY2u1E6HeXAd
	sW2flHE+lVG8td+yhp1sGQE7A7N247ZQfSEMDpkHwCAGtkPACJ8MhE2WiKrmmOU/p7abbcnYqTo
	3afo2mfJP6ySlcccHMOXKtSZ9tQRwU+xv+6Kv7Pm/48FKLCyYrTR4l3nSqpFBQr6KzZqBxFuwIN
	rLqA==
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id
 ada2fe7eead31-7d64d43bcc7mr1812425137.2.1794627047354; Fri, 13 Nov 2026
 19:30:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Fri, 13 Nov 2026 21:30:36 -0600
X-Gm-Features: AclHuK8b75Fk-1RSRh9Q1vYDh7AWBSUZpRAbQcRD3QXXJl6D-8li7ykdtCf4qmc
Message-ID: <CAKobHXD6beuX0RJb0CS+aMB9N9_8tbvd-LKtpuDHRbhsBNsPrg@mail.gmail.com>
Subject: ath12k: NULL dereference in ath12k_link_sta_rhash_delete() when an
 MLO station is removed during recovery
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_193049_453850_B885C0F2 
X-CRM114-Status: GOOD (  16.47  )
X-Spam-Score: -0.7 (/)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,LOCALPART_IN_SUBJECT,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

I hit a kernel panic on an AP with three QCN9274 hw2.0 on PCIe that are
grouped into one hardware group through the WSI graph (IPQ9574 board,
one AP MLD across 2.4, 5 and 6 GHz).

Software: OpenWrt main, kernel 6.18.60, wireless stack from backports
7.2 with OpenWrt's ath12k patches (none of them touch the functions
named below), hostapd from OpenWrt main, firmware
WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1 on all three chips.

Seen once; I have not tried to reproduce it yet. This report and the
source analysis in it were written with Claude, an AI coding assistant.

What happened

1. A multi-link client (Intel BE200, links on 6 GHz and 5 GHz,
   association link 6 GHz) was connected and passing traffic normally.

2. The 6 GHz link of the AP MLD was restarted alone (OpenWrt "wifi
   reload" after a channel width change on that radio). hostapd logged
   "Announce the removal of ap-mld0 on phy phy1.0 before its restart"
   and CTRL-EVENT-LINK-STA-REMOVED link_id=0. The driver logged (the
   prefix "ath12k_wifi7_pci 0002:01:00.0:" is shortened to "0002:",
   that is the 6 GHz chip; "0003:" is the 5 GHz chip; client addresses
   are masked):

   0002: Timeout in receiving vdev delete response
   0002: removing stale peer xx:xx:xx:xx:xx:2a from vdev_id 0

   From here the client was still associated (hostapd listed it on the
   5 GHz link, the client showed both links), but no frame reached it
   any more. That is the first problem: the station is neither moved
   nor removed.

3. Two minutes later the client disconnected and reconnected:

   0002: failed to clear all peer keys for vdev 1: -2
   0002: failed to find the peer to stop rx aggregation
   ap-mld0: HW problem - can not stop rx aggregation for
         xx:xx:xx:xx:xx:27 tid 0
   0002: mac station xx:xx:xx:xx:xx:2a disconnect for vdev 1 without
         any connected station
   0002: failed to get peer assoc conf event for xx:xx:xx:xx:xx:2b
         vdev 1
   0002: Failed to associate station: xx:xx:xx:xx:xx:2b
   0002: unable to move link sta 0 of sta xx:xx:xx:xx:xx:2b from
         state 2 to 3
   0002: failed to send WMI_PEER_DELETE cmd
   0002: failed to delete peer vdev_id 1 addr xx:xx:xx:xx:xx:2b
         ret -108
   0003: failed to send WMI_PEER_DELETE cmd
   0003: failed to delete peer vdev_id 0 addr xx:xx:xx:xx:xx:2a
         ret -108
   mhi mhi2: Requested to power ON
   (then mhi1 and mhi3: all three devices of the group restart)

4. About six seconds into that recovery:

   Unable to handle kernel read from unreadable memory at virtual
     address 0000000000000000
   Internal error: Oops: 0000000096000005 [#1] SMP
   CPU: 3 UID: 101 PID: 2306 Comm: hostapd
     Tainted: G O 6.18.60 #0 NONE
   pc : ath12k_link_sta_rhash_delete+0x3c/0x220 [ath12k]
   lr : ath12k_mac_op_sta_state+0xe18/0x1764 [ath12k]
   Call trace:
    ath12k_link_sta_rhash_delete+0x3c/0x220 [ath12k] (P)
    ath12k_mac_op_sta_state+0xe18/0x1764 [ath12k]
    drv_sta_state+0x80/0x3e4 [mac80211]
    sta_set_sinfo+0x1158/0x1194 [mac80211]
    sta_info_destroy_addr_bss+0x34/0x48 [mac80211]
    ieee80211_del_station+0x1c/0x54 [mac80211]
    nl80211_del_station+0xdc/0x144 [cfg80211]
    genl_family_rcv_msg_doit+0xcc/0x140
    ...
   Code: f9641035 f9642037 79505418 79505819 (f94002b4)
   Kernel panic - not syncing: Oops: Fatal exception in interrupt

What the cause of the panic looks like

ath12k_core_reconfigure_on_crash() starts by calling
ath12k_link_sta_rhash_tbl_destroy(ab), which frees the table and sets
ab->rhead_sta_addr to NULL. The table is created again in
ath12k_core_start() once the firmware is back. In that window user
space can still delete a station. For an MLO station
ath12k_mac_ml_station_remove() calls ath12k_link_sta_rhash_delete() for
every link without looking at the device state, and
ath12k_link_sta_rhash_remove() passes ab->rhead_sta_addr straight to
rhashtable_remove_fast(). With the table pointer NULL that is the read
at address 0. ath12k_link_sta_rhash_insert() and
ath12k_link_sta_find_by_addr() use the pointer the same way.

Questions

- Is the table meant to be torn down at the start of recovery while
  mac80211 still holds stations, or should the entries be flushed and
  the table kept until the stations are gone?
- Would a guard in the insert/remove/lookup helpers (table pointer
  NULL, return -ENOENT) be acceptable as a fix, or should the station
  remove path skip the per-device cleanup while the device is in
  recovery? I can test either on this board.
- Separately, is a restart of a single link of an AP MLD (step 2)
  expected to leave multi-link stations in that state with this
  firmware, or should the station be dropped?

I can provide the full console log.

Hardware and firmware: QCN9274 hw2.0 PCI
WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Thanks,
Christopher Griffin

