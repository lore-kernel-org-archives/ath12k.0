Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5C3C4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGrRWcDAzHnrgpG3aebm5DhxSp1gebBKe7MwUgBFSPA=; b=jtXqFtyZ9HmV9JL5mXG4c58r9c
	TbX4D5aRkSolz1aaMUkdJQJQQIyf0TCmvzl++k2SdmSaKEmJ17Gq6Pibo0MN/iVDoaRIen6fxJiy5
	FwCT68nVH7K76WW1HWeHLavij7Nt09wxx/E3MGWWp77FUiTU8SW/qKejDuKKiwgX7zSZBM6paQ7JL
	o5PPykuu7CjEQiGfhPoGb+5QyeJYs7mfnTEcySVBQ3QfvV0NZfUXaMH0sOFsXfgVNU6TDdEqH+fB3
	cZFDRPJmkRgGZH3+NxQDQ4UttWkvUZSGPKPsBQ2wdh4gKQ1Y4ZAw7rOuopoRM/bcR/KHTunGoyVIn
	fwaOHWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDxD-0000000GcI2-3e9f
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 10:16:19 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDxA-0000000GcHF-34kj
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 10:16:18 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-516ef30b16eso881184e87.3
        for <ath12k@lists.infradead.org>; Fri, 12 Apr 2024 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712916973; x=1713521773; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGrRWcDAzHnrgpG3aebm5DhxSp1gebBKe7MwUgBFSPA=;
        b=Q5fm+1hYfpwG44+F6baI3791MV+ImMSENFsRf513O2izoUfg+P3ckhEsbfeaxs+hl5
         4TvoQw15hgbJKAh3pVOgIOoT/CXXOPx+vALOsePsqyasVYryufHFr6u/pdGceKrWDEYT
         vYQdGgo/nShDpjE5S+8TT0ZRfoncTL1z36ZzGS/HEvTorB69fxIE1KJLTyHdNko4be4k
         EA0FCLbez7qX4Hn2qFB2TaphYccpy9uIWLLo+rFb9XK6awgx3uR5H1klByGOJWlg+YFh
         Mp3gT7TZVhbR6YJER97W20ENguz3GE8AG55IYe4bUlNDu5FoLG7luhhzgfn2ir+eZZbB
         YsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712916973; x=1713521773;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BGrRWcDAzHnrgpG3aebm5DhxSp1gebBKe7MwUgBFSPA=;
        b=rmc8lBVwhUzIfjACXCp/rqzkb9x/KIVaqjob/Ktmzhj9k3oITY56rvlg6ltHz6/I02
         YeD3VS6KEiPYIT1W1O+EG1F9JWWqF63yArjUWCZxtW9H/xkUd3z6IaTBrPh8oVuAr7mE
         F5scRPtWVnK7voCaV5bAqHcmqnBRXsElHeWndpdwyWv4z5By/SCNXnP3tKOp7G6QC13V
         4HDQN+2/gOMiJWCfA66heCir0h0t90sPChToZe3mFR9vvaLJItzkiUDN2MCPMvTJH6Yg
         gvNEkyUcBCv0LASzkdHDQY1U+uXjySCla2hqZYDsGYDYuJMQ6YLmlrAfL/yRUBTIGV0A
         ySmg==
X-Forwarded-Encrypted: i=1; AJvYcCWbjMuvODzlaK7G/UegiVi+Ai4MHfCogUnw1c2YwtX0O9qQd7nB2QUFM7ZD2DDLwZKxzv7T14irs/9nFjbxN9Ov/J1nAxyju2D4CQ==
X-Gm-Message-State: AOJu0YwaMOk0P7QOkaH6BzoE0r0S230SeBz8QIfEUpIPVwZO+p8+mBzR
	CSLPtF/gclEhodaOe+scoTNgh2zGGXZmE8Q2mCJXUItURlz5pwGX
X-Google-Smtp-Source: AGHT+IHAhqUMNAs4au7XNEG9h1rC96yaBYY144lJPsY1DCLhu1ZUbIcRpWNF+w2WYXcZDpVqJiZMag==
X-Received: by 2002:a19:2d56:0:b0:518:8d15:8810 with SMTP id t22-20020a192d56000000b005188d158810mr478079lft.14.1712916972856;
        Fri, 12 Apr 2024 03:16:12 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id z4-20020a5d6404000000b00343b09729easm3925777wru.69.2024.04.12.03.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 03:16:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Apr 2024 12:16:12 +0200
Message-Id: <D0I2E1O0GLM5.12RQY3BJEOKVY@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "kangyang" <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3] wifi: ath12k: add support to handle beacon miss for
 WCN7850
X-Mailer: aerc 0.17.0
References: <20240412094447.2063-1-quic_kangyang@quicinc.com>
In-Reply-To: <20240412094447.2063-1-quic_kangyang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_031616_907200_A019C026 
X-CRM114-Status: GOOD (  29.58  )
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

On Fri Apr 12, 2024 at 11:44 AM CEST, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
>
> When AP goes down or too far away without indication to STA, beacon miss
> will be detected. Then for WCN7850's firmware, it will use roam event
> to send beacon miss to host.
>
> If STA doesn't handle the beacon miss, will keep the fake connection
> and unable to roam.
>
> So add support for WCN7850 to trigger disconnection from AP when
> receiving this event from firmware.
>
> It has to be noted that beacon miss event notification for QCN9274
> to be handled in a separate patch as it uses STA kickout WMI event
> to notify beacon miss and the current STA kickout event is processed
> as low_ack.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_S=
ILICONZ-3
>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>
> v3: move INIT_DELAYED_WORK to add_interface().
> v2: rebased on latest tag: ath-202404101413.
>
> ---
>  drivers/net/wireless/ath/ath12k/core.h |  2 +
>  drivers/net/wireless/ath/ath12k/mac.c  | 75 +++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.h  |  2 +
>  drivers/net/wireless/ath/ath12k/wmi.c  | 34 ++++++------
>  drivers/net/wireless/ath/ath12k/wmi.h  |  3 ++
>  5 files changed, 98 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireles=
s/ath/ath12k/core.h
> index 397d8c973265..e125efe20dde 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -46,6 +46,7 @@
>  #define ATH12K_SMBIOS_BDF_EXT_MAGIC "BDF_"
> =20
>  #define ATH12K_INVALID_HW_MAC_ID	0xFF
> +#define ATH12K_CONNECTION_LOSS_HZ	(3 * HZ)
>  #define	ATH12K_RX_RATE_TABLE_NUM	320
>  #define	ATH12K_RX_RATE_TABLE_11AX_NUM	576
> =20
> @@ -275,6 +276,7 @@ struct ath12k_vif {
>  	u32 aid;
>  	u8 bssid[ETH_ALEN];
>  	struct cfg80211_bitrate_mask bitrate_mask;
> +	struct delayed_work connection_loss_work;
>  	int num_legacy_stations;
>  	int rtscts_prot_mode;
>  	int txpower;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless=
/ath/ath12k/mac.c
> index f15dcd75157d..e8ce9b940753 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1398,6 +1398,75 @@ static void ath12k_control_beaconing(struct ath12k=
_vif *arvif,
>  	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d up\n", arvif->vdev_id);
>  }
> =20
> +static void ath12k_mac_handle_beacon_iter(void *data, u8 *mac,
> +					  struct ieee80211_vif *vif)
> +{
> +	struct sk_buff *skb =3D data;
> +	struct ieee80211_mgmt *mgmt =3D (void *)skb->data;
> +	struct ath12k_vif *arvif =3D ath12k_vif_to_arvif(vif);
> +
> +	if (vif->type !=3D NL80211_IFTYPE_STATION)
> +		return;
> +
> +	if (!ether_addr_equal(mgmt->bssid, vif->bss_conf.bssid))
> +		return;
> +
> +	cancel_delayed_work(&arvif->connection_loss_work);
> +}
> +
> +void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb)
> +{
> +	ieee80211_iterate_active_interfaces_atomic(ath12k_ar_to_hw(ar),
> +						   IEEE80211_IFACE_ITER_NORMAL,
> +						   ath12k_mac_handle_beacon_iter,
> +						   skb);
> +}
> +
> +static void ath12k_mac_handle_beacon_miss_iter(void *data, u8 *mac,
> +					       struct ieee80211_vif *vif)
> +{
> +	u32 *vdev_id =3D data;
> +	struct ath12k_vif *arvif =3D ath12k_vif_to_arvif(vif);
> +	struct ath12k *ar =3D arvif->ar;
> +	struct ieee80211_hw *hw =3D ath12k_ar_to_hw(ar);
> +
> +	if (arvif->vdev_id !=3D *vdev_id)
> +		return;
> +
> +	if (!arvif->is_up)
> +		return;
> +
> +	ieee80211_beacon_loss(vif);
> +
> +	/* Firmware doesn't report beacon loss events repeatedly. If AP probe
> +	 * (done by mac80211) succeeds but beacons do not resume then it
> +	 * doesn't make sense to continue operation. Queue connection loss work
> +	 * which can be cancelled when beacon is received.
> +	 */
> +	ieee80211_queue_delayed_work(hw, &arvif->connection_loss_work,
> +				     ATH12K_CONNECTION_LOSS_HZ);
> +}
> +
> +void ath12k_mac_handle_beacon_miss(struct ath12k *ar, u32 vdev_id)
> +{
> +	ieee80211_iterate_active_interfaces_atomic(ath12k_ar_to_hw(ar),
> +						   IEEE80211_IFACE_ITER_NORMAL,
> +						   ath12k_mac_handle_beacon_miss_iter,
> +						   &vdev_id);
> +}
> +
> +static void ath12k_mac_vif_sta_connection_loss_work(struct work_struct *=
work)
> +{
> +	struct ath12k_vif *arvif =3D container_of(work, struct ath12k_vif,
> +						connection_loss_work.work);
> +	struct ieee80211_vif *vif =3D arvif->vif;
> +
> +	if (!arvif->is_up)
> +		return;
> +
> +	ieee80211_connection_loss(vif);
> +}
> +
>  static void ath12k_peer_assoc_h_basic(struct ath12k *ar,
>  				      struct ieee80211_vif *vif,
>  				      struct ieee80211_sta *sta,
> @@ -2570,7 +2639,7 @@ static void ath12k_bss_disassoc(struct ath12k *ar,
> =20
>  	arvif->is_up =3D false;
> =20
> -	/* TODO: cancel connection_loss_work */
> +	cancel_delayed_work(&arvif->connection_loss_work);
>  }
> =20
>  static u32 ath12k_mac_get_rate_hw_value(int bitrate)
> @@ -6317,6 +6386,8 @@ static int ath12k_mac_op_add_interface(struct ieee8=
0211_hw *hw,
>  	arvif->vif =3D vif;
> =20
>  	INIT_LIST_HEAD(&arvif->list);
> +	INIT_DELAYED_WORK(&arvif->connection_loss_work,
> +			  ath12k_mac_vif_sta_connection_loss_work);
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
>  		arvif->bitrate_mask.control[i].legacy =3D 0xffffffff;
> @@ -6449,6 +6520,8 @@ static void ath12k_mac_op_remove_interface(struct i=
eee80211_hw *hw,
>  	ar =3D arvif->ar;
>  	ab =3D ar->ab;
> =20
> +	cancel_delayed_work_sync(&arvif->connection_loss_work);
> +
>  	mutex_lock(&ar->conf_mutex);
> =20
>  	ath12k_dbg(ab, ATH12K_DBG_MAC, "mac remove interface (vdev %d)\n",
> diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless=
/ath/ath12k/mac.h
> index 3f5e1be0dff9..bfc655a4dfce 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.h
> +++ b/drivers/net/wireless/ath/ath12k/mac.h
> @@ -78,4 +78,6 @@ enum ath12k_supported_bw ath12k_mac_mac80211_bw_to_ath1=
2k_bw(enum rate_info_bw b
>  enum hal_encrypt_type ath12k_dp_tx_get_encrypt_type(u32 cipher);
>  int ath12k_mac_rfkill_enable_radio(struct ath12k *ar, bool enable);
>  int ath12k_mac_rfkill_config(struct ath12k *ar);
> +void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb);
> +void ath12k_mac_handle_beacon_miss(struct ath12k *ar, u32 vdev_id);
>  #endif
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless=
/ath/ath12k/wmi.c
> index a5575ce9eed4..4fe39e920902 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -5927,10 +5927,8 @@ static void ath12k_mgmt_rx_event(struct ath12k_bas=
e *ab, struct sk_buff *skb)
>  		}
>  	}
> =20
> -	/* TODO: Pending handle beacon implementation
> -	 *if (ieee80211_is_beacon(hdr->frame_control))
> -	 *	ath12k_mac_handle_beacon(ar, skb);
> -	 */
> +	if (ieee80211_is_beacon(hdr->frame_control))
> +		ath12k_mac_handle_beacon(ar, skb);
> =20
>  	ath12k_dbg(ab, ATH12K_DBG_MGMT,
>  		   "event mgmt rx skb %pK len %d ftype %02x stype %02x\n",
> @@ -6137,42 +6135,44 @@ static void ath12k_roam_event(struct ath12k_base =
*ab, struct sk_buff *skb)
>  {
>  	struct wmi_roam_event roam_ev =3D {};
>  	struct ath12k *ar;
> +	u32 vdev_id;
> +	u8 roam_reason;
> =20
>  	if (ath12k_pull_roam_ev(ab, skb, &roam_ev) !=3D 0) {
>  		ath12k_warn(ab, "failed to extract roam event");
>  		return;
>  	}
> =20
> +	vdev_id =3D le32_to_cpu(roam_ev.vdev_id);
> +	roam_reason =3D u32_get_bits(le32_to_cpu(roam_ev.reason),
> +				   WMI_ROAM_REASON_MASK);
> +
>  	ath12k_dbg(ab, ATH12K_DBG_WMI,
> -		   "wmi roam event vdev %u reason 0x%08x rssi %d\n",
> -		   roam_ev.vdev_id, roam_ev.reason, roam_ev.rssi);
> +		   "wmi roam event vdev %u reason %d rssi %d\n",
> +		   vdev_id, roam_reason, roam_ev.rssi);
> =20
>  	rcu_read_lock();
> -	ar =3D ath12k_mac_get_ar_by_vdev_id(ab, le32_to_cpu(roam_ev.vdev_id));
> +	ar =3D ath12k_mac_get_ar_by_vdev_id(ab, vdev_id);
>  	if (!ar) {
> -		ath12k_warn(ab, "invalid vdev id in roam ev %d",
> -			    roam_ev.vdev_id);
> +		ath12k_warn(ab, "invalid vdev id in roam ev %d", vdev_id);
>  		rcu_read_unlock();
>  		return;
>  	}
> =20
> -	if (le32_to_cpu(roam_ev.reason) >=3D WMI_ROAM_REASON_MAX)
> +	if (roam_reason >=3D WMI_ROAM_REASON_MAX)
>  		ath12k_warn(ab, "ignoring unknown roam event reason %d on vdev %i\n",
> -			    roam_ev.reason, roam_ev.vdev_id);
> +			    roam_reason, vdev_id);
> =20
> -	switch (le32_to_cpu(roam_ev.reason)) {
> +	switch (roam_reason) {
>  	case WMI_ROAM_REASON_BEACON_MISS:
> -		/* TODO: Pending beacon miss and connection_loss_work
> -		 * implementation
> -		 * ath12k_mac_handle_beacon_miss(ar, vdev_id);
> -		 */
> +		ath12k_mac_handle_beacon_miss(ar, vdev_id);
>  		break;
>  	case WMI_ROAM_REASON_BETTER_AP:
>  	case WMI_ROAM_REASON_LOW_RSSI:
>  	case WMI_ROAM_REASON_SUITABLE_AP_FOUND:
>  	case WMI_ROAM_REASON_HO_FAILED:
>  		ath12k_warn(ab, "ignoring not implemented roam event reason %d on vdev=
 %i\n",
> -			    roam_ev.reason, roam_ev.vdev_id);
> +			    roam_reason, vdev_id);
>  		break;
>  	}
> =20
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless=
/ath/ath12k/wmi.h
> index 78afc94a815d..ebf73ddcadc6 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -4182,6 +4182,9 @@ struct wmi_peer_sta_kickout_event {
>  	struct ath12k_wmi_mac_addr_params peer_macaddr;
>  } __packed;
> =20
> +#define WMI_ROAM_REASON_MASK		GENMASK(3, 0)
> +#define WMI_ROAM_SUBNET_STATUS_MASK	GENMASK(5, 4)
> +
>  enum wmi_roam_reason {
>  	WMI_ROAM_REASON_BETTER_AP =3D 1,
>  	WMI_ROAM_REASON_BEACON_MISS =3D 2,
>
> base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9

LGTM, you can have my reviewed by if needed.

Reviewed-by: Nicolas Escande <nico.escande@gmail.com>

