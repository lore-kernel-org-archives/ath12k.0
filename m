Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9908606A321
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 20:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zLBPHQ5F;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=odAzipFZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=exx+dp31
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zGHtBxAPYsJ50s7xgldA7nxDdVzLshBLi9zRXsaND/k=; b=zLBPHQ5Fm6KJQx
	5bI/MektapIb8HLt7UcaToZLo4/34bpXV7c7geWWS1GZ0CxNLEVwuh9bw6NhjL6DEsoM6PQtyA1/K
	wOqO8AR+L3BzGHTS/78J4xzPcIFMDTuZjbjnTG83AAm9OCxzagIGpdw3tXHNYmpYEi19UzMdcK6U/
	Bi8TCkrft04YYjKwHH3X/lM50yZGPGL8vek5yID6wKbf4hs6nFm18uPnrd97s9ilG2drp6qX6S4xd
	zrO8JntzphbLpdyyQ5eYx4PtQQ5EkvRMCYg95yoVCd0ztQG5YFjojSm49ooO9FU/mKcM1DeZbRR/g
	QeSSU1oPzK9qHUnvH5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxX7-00000007nMT-3xeg;
	Tue, 24 Nov 2026 20:54:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxX5-00000007nM7-1nc6
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 20:54:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXo6D365939
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 20:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGHtBxAPYsJ50s7xgldA7nxDdVzLshBLi9zRXsaND/k=; b=odAzipFZyiXyd9F5
	CbUqOf+lpvMImhKFQC8Z9QoAWbLGMP3XPPkb7uD+hbGw//MmaUr7Kle8rvxRugv0
	P0eGzh8p89GneitxX4Dmn88enhlk374oPqx5fHBtkCV7u+zzzk61JKUzeff9dAQt
	WuiU1/hbgjM6t01Y0wPsOH3b+dO/navUE951FFXwsPt45S8B/GVYq5CkkJszmJc8
	6vKoRcCkeFGTol1ryyaUDgyL0ubAjxw+l4k6XwvpvdL5QZENJzhYN8uex8GdBz4A
	fAtuFHvZbS6I+TKBkSttYLNjfzBYXR04YO5aYV4nTZNYnupdG9KII52+Qh5wohSB
	Xozlow==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhbw2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 20:54:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so4897559eec.0
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 12:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795553669; x=1796158469; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zGHtBxAPYsJ50s7xgldA7nxDdVzLshBLi9zRXsaND/k=;
        b=exx+dp31PxEy7/kZtTI4AtYc+MgfFPdzNXxVIlpdILTeIWx5VJDO1tUck8k79zJZXx
         KXIi1hJoJCPChda3L/RloliqmnDrP5zMkBGidAK5rbi7oCAOwuAVMbv5BDkqX/co/g7f
         VKakYAYcXdbiSNFtW1MbzI0FXs5aL8g5OO1Xjv7gVskYV7kGhOO6r01L+WRD1KRj8VRi
         eMa6LFyFZ0ez/DP7kPEfDPr8RmJ7Y7ERvppYeoM/tTu1D9BtiKJ4uBkJkGsJRbGdKJxC
         6xDzRYfy+Itgl4W8PclWcrriuplrEyBsqvHbb1f0T/1EZGTkFK9ch8VideXBZMtMxkhD
         sMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553669; x=1796158469;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGHtBxAPYsJ50s7xgldA7nxDdVzLshBLi9zRXsaND/k=;
        b=m3zUWeQvn6Cpwd3Hgtx0s6ShnEBcYkt3Di29xX8eUhxVBY1u+2vBhUuvBlbNrdLh9d
         G2zNE4M0XlrEZIOWCekjBq1cFxmBgpDLVBf2LvjkVCfj6PNE3L4uJcbTcwo0ffnNUf0E
         Eg1kd0AoGOAgwzMRHEemDagwzRFkEFbtQEz5Ka2TtXf21QIb1va+ZTER8RDMylbN3gGp
         4IZHCZqZcyNoDmKFGQsRfX1YS9kD5FUaWFjwdiQyGFSqI9rBZ1Yi0EN76gAN/V22dVMT
         OLkcM2k/PqoeNOlDa88YGkugwwi54dmfZ2Jz0nlbgaAmi6CgHA5jTFq+39o1sGj7qZze
         5BjA==
X-Gm-Message-State: APuU4Z/uBxQIOxjCmdVPjOYK9GEfnhG0KM/IjZN7eEarTsavbgJIpv+o
	f83ZaF3K41CEmEjK3DCoZzid5GvBEobh34eo8cPXrbHaEl8BpVMijUuatcBEsS0iXfGRgqqZ8XJ
	udJ4PBSCajQMMM+uBbUkw1Q/JuzVEepx48Jt9I4MDJ7tiJ5l8hjHd7Ho4zmMWjsUk
X-Gm-Gg: AZFdTZcDQHXVzIBPW50eCc+5pDeOaWvVA36eijh4VkVEtnAA6UsYbzIyQwhfGHfhfBY
	7Z+3mDdRMndjnWdaiBPn9chgcbmxCOWyTU6mMx7RO+gnacsqEz/EW7gkHXemUKMtNv3wufSbPzW
	NlkLrC4NTPV6389Zscq8TiehYbTHuJos/oGCkM6GyyFLsG36ahQNfAsDd9BQ1feEEtLqVcUJ5XJ
	Q3LAj1TYos5nMnNPgDK5QOLklZ1QawAt7MS0jyrNlxwZsPoyuNFg0fbVIeP0gFW75IlnKX/dy0H
	iGih2cZMG25QBFnWRuDQO/XQKdQM7vlnPDGC7lw03y15jZmKXjEnDcSE6ZNNedtThR0u524XH+b
	y75uJIydo7tM8TuRPpWPS0QnQruGHHvCXWz175MZyC3EmXYR2Bt4cqIG6dSzRRPsCFkpKwGOkuL
	A7OmsQlJziTVC7+ZYD
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr17921597eec.40.1795553669046;
        Tue, 24 Nov 2026 12:54:29 -0800 (PST)
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr17921568eec.40.1795553668440;
        Tue, 24 Nov 2026 12:54:28 -0800 (PST)
Received: from [192.168.11.103] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm46139437eec.15.2026.11.24.12.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:54:27 -0800 (PST)
Message-ID: <d10c7d75-2113-454d-bffb-a71b826ccff6@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 02:24:24 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 7/7] wifi: ath12k: handle MLO active link updates
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <20261118025520.39269-8-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-8-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05f986 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lZnIY_QNQNzb0u9bTJAA:9 a=zlulEwOhvs9ORIPW:21
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MiBTYWx0ZWRfX3LastJBLtD6V
 OJY0WtqmbHj7Mn0Anak8vQFxtZY0SvlhCrQOGCSWdrWyUUnxp2SntywbWHkLvjZtGM4OQ+Gcjno
 iVhx8katdOJFb/UEx/sx80vl9PW9FEE=
X-Proofpoint-GUID: Ie16a7ujVLd9TXKG1xiOM8qB11kl8vLp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MiBTYWx0ZWRfX4huPZ0HGqvQl
 oj29OpKJZxhnVfRuLGF9e2iNxSGEhJaunaZ7O8M4sLt2El4w/e9VBRmVJmHHEG7FJr6EPkiVuMB
 kzFBnbkZ9d3M1cHsQzV7trkJ3ygohlXJqNPyqRHUSHZ5RjyTmDWbPBSLWxvsjBsjDIjm5QDms6r
 mzR7y/P3peTDRKBa+LYjai5aHFJy+tAIKchzeu0Lxdbd8S/gebDZ3GU9W3xOH+WjNVjg29rucvc
 3vGTT7HQMhNLzAJV63uq6Tf2Xqfm0mOg7qfjwwDldc2UpPDVJIvzL4ybp//r6NR2/os5RmvanfT
 HJvnWm4rq+E6NKJIGWFMEM9ya74/bJ7LuqBo2eGHZFJKtda1/WxYND3d5DAXhaot5yyr1CYJAtl
 zFUlyUKtc5FDRWJAsogW52sulyD5ppV5HHm+B3F2RRlVXZ1yFEw285t5/SvMNWH5blTJfA8sY41
 X53Yf7f00ug/9KSJzaQ==
X-Proofpoint-ORIG-GUID: Ie16a7ujVLd9TXKG1xiOM8qB11kl8vLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_125431_485087_C6B85589 
X-CRM114-Status: GOOD (  39.87  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/2026 8:25 AM, Miaoqing Pan wrote:
> ath12k_mac_op_change_sta_links() handles both valid-link and active-link
> changes from mac80211. For an active-link change, old_links and new_links
> are the active sets. The callback returned early whenever new_links was
> smaller than old_links, and outside connect nothing sends an active-link
> command to firmware. So when an associated MLO STA deactivates a link,
> e.g. active links 0x5 -> 0x1, firmware keeps link 2 active while
> mac80211 has already released its channel context.
> 
> Sync the active links to firmware from the callback once the STA is
> AUTHORIZED:
> 
> - Create link STAs for sta->valid_links instead of new_links. Firmware
>    cannot remove a single link sta, so removals are only logged and are
>    left to STA removal.
> - Take the active set from channel contexts: a link with a link STA and
>    a link vif is active if it holds a chanctx, inactive otherwise.
>    mac80211 releases the chanctx of a deactivated link and assigns one to
>    a newly activated link before it calls the callback.
> - Send WMI_MLO_LINK_SET_ACTIVE only when this set differs from the one
>    last programmed, cached per vif. Send it to each device that holds
>    vdevs of the STA, with that device's links, and wait up to 5 seconds
>    for each response. Two active links on the same MAC use
>    INACTIVE_LINK_NUM, as at connect, and that command is not waited for.
>    Update the cache only if all devices succeed, so a failed sync is
>    retried on the next callback.
> - Reset the cache on ASSOC -> AUTHORIZED, so the first sync after each
>    (re)connect is always sent. This also covers hw restart, where
>    mac80211 replays the station state transitions.
> 
> If the device crashes while a request is pending, the waiter still holds
> the wiphy lock. ath12k_core_pre_reconfigure_recovery() therefore releases
> the waiter before it takes the lock, otherwise recovery stalls until the
> timeout expires.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c |  15 ++
>   drivers/net/wireless/ath/ath12k/core.h |  20 ++
>   drivers/net/wireless/ath/ath12k/mac.c  | 241 +++++++++++++++++++++++--
>   drivers/net/wireless/ath/ath12k/wmi.c  |   9 +-
>   drivers/net/wireless/ath/ath12k/wmi.h  |   1 +
>   5 files changed, 271 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 42a9cd28c652..183da4cb5e64 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1524,6 +1524,19 @@ void ath12k_core_halt(struct ath12k *ar)
>   	idr_init(&ar->txmgmt_idr);
>   }
>   
> +static void ath12k_core_abort_mlo_link_set_active(struct ath12k_base *ab)
> +{
> +	struct ath12k_mlo_link_set_active_req *req;
> +
> +	rcu_read_lock();
> +	req = rcu_dereference(ab->mlo_link_set_active_req);
> +	if (req) {
> +		req->status = -ESHUTDOWN;
> +		complete(&req->done);
> +	}
> +	rcu_read_unlock();
> +}
> +
>   static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
>   {
>   	struct ath12k_hw_group *ag = ab->ag;
> @@ -1538,6 +1551,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
>   	if (ab->is_reset)
>   		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>   
> +	ath12k_core_abort_mlo_link_set_active(ab);
> +
>   	for (i = 0; i < ag->num_hw; i++) {
>   		ah = ath12k_ag_to_ah(ag, i);
>   		if (!ah || ah->state == ATH12K_HW_STATE_OFF ||
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 7c7057468916..74f184d283b7 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -401,6 +401,12 @@ struct ath12k_vif {
>   	struct ath12k_link_vif deflink;
>   	struct ath12k_link_vif __rcu *link[ATH12K_NUM_MAX_LINKS];
>   	struct ath12k_vif_cache *cache[IEEE80211_MLD_MAX_NUM_LINKS];
> +	/*
> +	 * Last active/inactive link state programmed to firmware via
> +	 * WMI_MLO_LINK_SET_ACTIVE. Zero means unknown: forces a resend.
> +	 */
> +	u16 fw_active_links;
> +	u16 fw_inactive_links;
>   	/* indicates bitmap of link vif created in FW */
>   	u32 links_map;
>   	/* Must be last - ends in a flexible-array member.
> @@ -797,6 +803,12 @@ struct ath12k {
>   	} incumbent_signal_interference;
>   };
>   
> +struct ath12k_mlo_link_set_active_req {
> +	struct completion done;
> +	int status;
> +	struct rcu_head rcu_head;
> +};
> +
>   struct ath12k_hw {
>   	struct ieee80211_hw *hw;
>   	struct device *dev;
> @@ -1153,6 +1165,14 @@ struct ath12k_base {
>   #endif /* CONFIG_ACPI */
>   
>   	struct ath12k_hw_group *ag;
> +
> +	/*
> +	 * Set-active request in flight to this device, NULL when idle. Freed
> +	 * via kfree_rcu(). The links of an MLO STA can be on several devices,
> +	 * and each device is programmed separately, so at most one request is
> +	 * outstanding per device.
> +	 */
> +	struct ath12k_mlo_link_set_active_req __rcu *mlo_link_set_active_req;
>   	struct ath12k_wsi_info wsi_info;
>   	enum ath12k_qmi_firmware_mode fw_mode;
>   	struct ath12k_ftm_event_obj ftm_event_obj;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index dfb0f6e678ac..885eedbbdd67 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -7667,6 +7667,8 @@ static int ath12k_mac_mlo_sta_update_link_active(struct ath12k_base *ab,
>   	u8 num_mlo_vdev = 0;
>   	u8 link_id;
>   
> +	lockdep_assert_wiphy(hw->wiphy);
> +
>   	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
>   		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
>   		/* make sure vdev is created on this device */
> @@ -7982,6 +7984,14 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>   
>   	if (ieee80211_vif_is_mld(vif) && vif->type == NL80211_IFTYPE_STATION &&
>   	    old_state == IEEE80211_STA_ASSOC && new_state == IEEE80211_STA_AUTHORIZED) {
> +		/*
> +		 * The cached active link state is only updated while AUTHORIZED,
> +		 * so reset it on each ASSOC -> AUTHORIZED. The next active-link
> +		 * sync then sends the state to firmware.
> +		 */
> +		ahvif->fw_active_links = 0;
> +		ahvif->fw_inactive_links = 0;
> +
>   		for_each_ar(ah, ar, i) {
>   			ab = ar->ab;
>   			if (prev_ab == ab)
> @@ -8243,6 +8253,194 @@ static struct ath12k_link_sta *ath12k_mac_alloc_assign_link_sta(struct ath12k_hw
>   	return arsta;
>   }
>   
> +static struct ieee80211_chanctx_conf *
> +ath12k_mac_link_chanctx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> +			u8 link_id)
> +{
> +	struct ieee80211_bss_conf *link_conf;
> +
> +	link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
> +	if (!link_conf)
> +		return NULL;
> +
> +	return wiphy_dereference(hw->wiphy, link_conf->chanctx_conf);
> +}
> +
> +struct ath12k_mlo_dev_links {
> +	u8 active_vdev[IEEE80211_MLD_MAX_NUM_LINKS];
> +	u8 inactive_vdev[IEEE80211_MLD_MAX_NUM_LINKS];
> +	u32 active_freq[IEEE80211_MLD_MAX_NUM_LINKS];
> +	unsigned int num_active;
> +	unsigned int num_inactive;
> +};
> +
> +static u16 ath12k_mac_mlo_vif_active_links(struct ieee80211_hw *hw,
> +					   struct ieee80211_vif *vif,
> +					   unsigned long links)
> +{
> +	u16 active = 0;
> +	u8 link_id;
> +
> +	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> +		if (ath12k_mac_link_chanctx(hw, vif, link_id))
> +			active |= BIT(link_id);
> +	}
> +
> +	return active;
> +}
> +
> +static void ath12k_mac_mlo_sta_collect_dev_links(struct ieee80211_hw *hw,
> +						 struct ath12k_vif *ahvif,
> +						 struct ath12k_base *ab,
> +						 unsigned long links,
> +						 struct ath12k_mlo_dev_links *dl)
> +{
> +	struct ieee80211_chanctx_conf *conf;
> +	struct ath12k_link_vif *arvif;
> +	u8 link_id;
> +
> +	dl->num_active = 0;
> +	dl->num_inactive = 0;
> +
> +	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> +		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> +		if (!arvif || !arvif->is_created || arvif->ar->ab != ab)
> +			continue;
> +
> +		conf = ath12k_mac_link_chanctx(hw, ahvif->vif, link_id);
> +		if (!conf) {
> +			dl->inactive_vdev[dl->num_inactive++] = arvif->vdev_id;
> +			continue;
> +		}
> +
> +		dl->active_freq[dl->num_active] = conf->def.chan->center_freq;
> +		dl->active_vdev[dl->num_active++] = arvif->vdev_id;
> +	}
> +}
> +
> +static bool ath12k_mac_mlo_dev_same_mac(struct ath12k_base *ab,
> +					const struct ath12k_mlo_dev_links *dl)
> +{
> +	return dl->num_active == 2 &&
> +	       ath12k_mac_freqs_on_same_mac(ab, dl->active_freq[0],
> +					    dl->active_freq[1]);
> +}
> +
> +static int ath12k_mac_mlo_sta_send_inactive_link_num(struct ath12k_base *ab,
> +						     struct ath12k_mlo_dev_links *dl)
> +{
> +	return ath12k_mac_mlo_sta_set_link_active(ab,
> +						  WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT,
> +						  WMI_MLO_LINK_FORCE_MODE_INACTIVE_LINK_NUM,
> +						  NULL, dl->active_vdev, dl->num_active,
> +						  NULL, 0);
> +}
> +
> +static int ath12k_mac_mlo_sta_send_set_active(struct ath12k_base *ab,
> +					      struct ieee80211_vif *vif,
> +					      struct ath12k_mlo_dev_links *dl)
> +{
> +	struct ath12k_mlo_link_set_active_req *req;
> +	enum wmi_mlo_link_force_mode mode;
> +	int ret;
> +
> +	req = kzalloc_obj(*req);
> +	if (!req)
> +		return -ENOMEM;
> +
> +	init_completion(&req->done);
> +	rcu_assign_pointer(ab->mlo_link_set_active_req, req);
> +
> +	mode = dl->num_inactive ? WMI_MLO_LINK_FORCE_MODE_ACTIVE_INACTIVE :
> +				  WMI_MLO_LINK_FORCE_MODE_ACTIVE;
> +
> +	ret = ath12k_mac_mlo_sta_set_link_active(ab,
> +						 WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT,
> +						 mode, vif->cfg.ap_addr,
> +						 dl->active_vdev, dl->num_active,
> +						 dl->inactive_vdev, dl->num_inactive);
> +
> +	if (!ret && !wait_for_completion_timeout(&req->done,
> +						 ATH12K_MLO_LINK_SET_ACTIVE_TIMEOUT_HZ)) {
> +		ath12k_warn(ab, "timeout waiting for mlo set active links resp\n");
> +		ret = -ETIMEDOUT;
> +	}
> +
> +	if (!ret && req->status)
> +		ret = -EIO;
> +
> +	rcu_assign_pointer(ab->mlo_link_set_active_req, NULL);
> +	kfree_rcu(req, rcu_head);
> +
> +	return ret;
> +}
> +
> +static int ath12k_mac_mlo_sta_sync_active_links(struct ath12k_hw *ah,
> +						struct ath12k_vif *ahvif,
> +						struct ath12k_sta *ahsta,
> +						struct ieee80211_sta *sta)
> +{
> +	struct ath12k_base *ab, *prev_ab = NULL;
> +	struct ieee80211_hw *hw = ah->hw;
> +	struct ath12k_mlo_dev_links dl;
> +	unsigned long links;
> +	u16 active, inactive;
> +	struct ath12k *ar;
> +	int ret;
> +	int i;
> +
> +	lockdep_assert_wiphy(hw->wiphy);
> +
> +	links = ahsta->links_map & ahvif->links_map;
> +
> +	/*
> +	 * A link holding a channel context is active. The links of an MLO STA
> +	 * can be on different devices, so the active set is derived over all
> +	 * links and each device is then programmed with the links it holds.
> +	 */
> +	active = ath12k_mac_mlo_vif_active_links(hw, ahvif->vif, links);
> +	inactive = links & ~active;
> +
> +	if (!active) {
> +		ath12k_hw_warn(ah, "no active link for sta %pM\n", sta->addr);
> +		return -EINVAL;
> +	}
> +
> +	if (active == ahvif->fw_active_links &&
> +	    inactive == ahvif->fw_inactive_links)
> +		return 0;
> +
> +	for_each_ar(ah, ar, i) {
> +		ab = ar->ab;
> +		if (ab == prev_ab)
> +			continue;
> +		prev_ab = ab;
> +
> +		ath12k_mac_mlo_sta_collect_dev_links(hw, ahvif, ab, links, &dl);
> +
> +		if (!dl.num_active && !dl.num_inactive)
> +			continue;
> +
> +		if (!dl.num_active) {
> +			ath12k_hw_warn(ah,
> +				       "cannot deactivate all STA links on a device\n");
> +			return -EOPNOTSUPP;
> +		}
> +

for a configuration where more than one QCN9274 is combined in a hw 
group and advertised under one wiphy, the only link can be deactivated on ab

ah->radio[0] -- ab-1 QCN9274 5GHz
ah->radio[1] -- ab-2 QCN9274 6GHz

This setup can associate as 5+6GHz ML STA and if mac80211 deactivates 
one link say 5GHz, ath12k_mac_mlo_sta_collect_dev_links() will report 
dl.num_active as 0 and dl.num_inactive as 1 which is still valid.

I tested this with such a setup and when AP removes one link i get below 
errors,

root@buildroot:~# [  208.620233] wlan0: authenticate with 
00:03:7f:01:57:45 (local address=32:43:40:d5:13:f0)
[  208.620278] wlan0: send auth to 00:03:7f:01:57:45 (try 1/3)
[  208.646676] wlan0: authenticate with 00:03:7f:01:57:45 (local 
address=32:43:40:d5:13:f0)
[  208.646705] wlan0: send auth to 00:03:7f:01:57:45 (try 1/3)
[  208.656809] wlan0: authenticated
[  208.662463] wlan0: associate with 00:03:7f:01:57:45 (try 1/3)
[  208.681771] wlan0: RX AssocResp from 00:03:7f:01:57:45 (capab=0x111 
status=0 aid=1)
[  208.706457] wlan0: [link 0] local address 32:43:40:d5:13:f0, AP link 
address 00:03:7f:01:57:45 (assoc)
[  208.707397] wlan0: [link 1] local address 4a:cd:9a:9c:d5:a5, AP link 
address 00:03:7f:01:56:84
[  209.128875] wlan0: associated


root@buildroot:~# [  278.858680] wlan0: MLO Reconfiguration: work: 
valid=0x3, removed=0x2
[  278.860079] ath12k_wifi7_pci 0000:01:00.0: cannot deactivate all STA 
links on a device
[  278.864245] ath12k_wifi7_pci 0000:01:00.0: failed to sync mlo active 
links for sta 00:03:7f:01:57:45: -95
[  278.871936] ------------[ cut here ]------------
[  278.881468] WARNING: net/mac80211/link.c:650 at 
_ieee80211_set_active_links+0x398/0x3c8 [mac80211], CPU#0: kworker/u17:0/39
[  279.021054] Call trace:
[  279.028167]  _ieee80211_set_active_links+0x398/0x3c8 [mac80211] (P)
[  279.030428]  ieee80211_set_active_links+0x88/0x138 [mac80211]
[  279.036677]  ieee80211_ml_reconf_work+0xc8/0x13c [mac80211]
[  279.042579]  cfg80211_wiphy_work+0x94/0xcc [cfg80211]
[  279.047961]  process_one_work+0x178/0x2b0
[  279.053168]  worker_thread+0x180/0x2f4
[  279.057160]  kthread+0xf8/0x118
[  279.060806]  ret_from_fork+0x10/0x20
[  279.063845] ---[ end trace 0000000000000000 ]---



[Apologies for not catching this earlier :(]

-- 
Ramesh

