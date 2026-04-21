Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C44F94CB0
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 21:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8pp1RE019uS7wcr5tEGYa5lrrV0sEz4reE3w0DGdmA=; b=UEVlhfPzIlPJWsv4J0rjrU3dyg
	IY37Pu7PEn58l/eTKvs0+SJSa68TrhTMK6M3ktgNbfN+1MPUkSe7JooyrOlWmk4fg373UQDRVkz3P
	zgtRe/d9glH74b/wFu9RUl8HNyqjJ0XhRpQfoD7/QeATONrplbsCbqsQyCFoA6zmt7JSe20N3WMQe
	mOLzXfsxnwpjixN8/OKA86GsoQHzO5l7ttAwJS4b+BhZAb8fj+Ccs2qO/58kkJOofi/71xYGMUukA
	NVXU2vXja8SxX7LpRg9aN0Gm9+ZQAbKv3mhIdRCkVklQlQr9xWl9vueT90scwdJ9Q+yKZV2z17YFJ
	t4r4RoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFId0-00000009BCf-2jSo;
	Tue, 21 Apr 2026 21:27:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFIcx-00000009BCI-1pxy
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 21:27:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIa8UJ3083048
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 21:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8pp1RE019uS7wcr5tEGYa5lrrV0sEz4reE3w0DGdmA=; b=ktlLc7Xc+EABsnHD
	qhIh+BNaS0XkZTsMS+D99+jghplovGzFe1cAlk+igFFv9yU3tjOj35xZxp4pc3rc
	8o32ywNHdW0nAfcUDa/8jZw83OJWc4el+ehte5nwqEZgkZEk0xbtZjDTlu4eROoW
	il5tMi4cbbEB2pexVgCbryPPZr/Kmccely7f/TFqlB6INkhXnHinQCxir+hhlZ0t
	QW7PgyfqxfGv6z2RizFZuV8s6OK18CxLq1NRXlG/mL7zAcgh+s4U+XQ3CBiZvlAj
	S8M9JVrqWU/JlSUW9OdlXmN4vKSsGSeM0pLZT4vUj/FLxdegzys6Nm5V3rYjFYCO
	vO7rEw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmgge4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 21:27:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c8de02a4dso31572c88.1
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 14:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776806844; x=1777411644; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8pp1RE019uS7wcr5tEGYa5lrrV0sEz4reE3w0DGdmA=;
        b=AxvmaEWJesToXOukUDpwxXXZKUS9JtA7+IzvWF44NeVfqVPfs2GXd8fqJRBnmCZXGb
         XQLf5AzvpAu0d5gB7EgPDused2fB3uZluo/UzCg2yMbAEw4GUwkf+a6odJ8cesfzPIJG
         b/faPWErH9p2fCcPieMVFBhHjIDteNgrCDprGk6w3ChcF4CBzkCxed1sFHTJD6Rkh9nq
         cfm/jzOtRxGx0R7NAUkCB/eCbyiOumQWafmqHlWG+X2A7rS1a6tJFJpeQHTXHjTktYyv
         kMm5V3YVmmnScBUCTHBM4HGYZFJJBPxmyb60NC4RnFpe/L4YkDgS11P2hkpAptx9OG83
         TACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776806844; x=1777411644;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8pp1RE019uS7wcr5tEGYa5lrrV0sEz4reE3w0DGdmA=;
        b=SVEG5C2RNYcZ/Zlx3ELe2NkmgzvatKPO8OeEml5InR8e5Tc+ues+6WDI2tYyIun8ZI
         OwVY2MUXG3oHtq2E5AVm7jkfzpMnIyOFLzAXRqYhAXpiY0Q+Bf72j+LRQ6FRMFA7Uo9m
         em8PnAbSsbNQmLrcbqDtZZzaavCvO0GnO3sw+2iOZGoY9y4Yb1qv1zMVpCBxw/Eo/jfq
         kbkZCI0HUYV6U9NHdWp+FeFbs+srBam0iQ9iE4N/JAMtyyEoEaqXx5UYMblzU5ppZYLS
         rpHDtipw0K1vZ6zCfrf3PALXnVhZkzEicy/cBiMdy43UjlOzZ6hgwRC3bmi33lyVh0mh
         H9MQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4PIeQF7oka5Zh2BzxMeZzkBho/ONtYVdjN/ijP7i5E9HjqYvZHT9SgAl/Gt88qPnDMZpBM10=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTCyuzRnkAvPS0pCz/tCCXjYAtCaVn73zFClZrKKPDwMavwNn+
	STkWWipti+USp/8seWdgO0Ri7NGZhf2mbmJClF9u6T7lDMfzt1d1C7NtfUPdIi8S4mroQdOsExb
	Oupes0NwOuMrgOJ7VoQYpWRuGrZh3YUAu74WFQFc1X/O8VE7VughRxBVda0pr6hMI
X-Gm-Gg: AeBDieuHoxQVXHYNIG8LZRDk3ebH+Nk9Oka1WWUV1Og/2JF9gCm4ksMrSG5hJwz79SN
	vIIOuABI90Ns2A9iGTWZ/VF1ktd2hJHEV2EnaGpJLzL48wDShDVOd6OE0evnNdzhj8xJHsui1Tf
	IcslDUoPXVCqvshaqIivpeGAJj1F7w2pGekcUfMpAN7cpeLLLY/lIES5JZv3Rz1SxIsA4vXIh3h
	gJBIWtB7dGMR089SIxjxbKK2Mxl2dG4KcYZ8cOBrXoapKMYoun4Ljh0GVUSr69yR684zLf74aCC
	OP4XgDXQ4QnxZ0k1CjAG3adqbn2lLUOqc93vi3nhpojJ+pKmrIm8RtEIC8tONG9Hwu4V1O0ka4o
	MI23kERVEHjVcKITdOvPkdruPkqWSH+L4xcCKhxJTujsZQ0mOZJHIHsLAdmPbgr6FJ5A5gYKbFg
	uFJ5hyTELngR5Z984HeNMSg++R
X-Received: by 2002:a05:7022:502:b0:12a:713b:896a with SMTP id a92af1059eb24-12c73f92f99mr12165254c88.17.1776806843651;
        Tue, 21 Apr 2026 14:27:23 -0700 (PDT)
X-Received: by 2002:a05:7022:502:b0:12a:713b:896a with SMTP id a92af1059eb24-12c73f92f99mr12165212c88.17.1776806842907;
        Tue, 21 Apr 2026 14:27:22 -0700 (PDT)
Received: from [192.168.1.47] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm11400458c88.1.2026.04.21.14.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 14:27:22 -0700 (PDT)
Message-ID: <a396cf77-81ff-45a7-ae62-fb4e22c18497@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:27:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix false positive RCU warnings on
 PREEMPT_RT
To: Yu-Hsiang Tseng <asas1asas200@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
 <20260421172500.1050754-1-asas1asas200@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260421172500.1050754-1-asas1asas200@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gfirpDql7dglRXzVgcYPlFO7NFwI8Yt7
X-Proofpoint-ORIG-GUID: gfirpDql7dglRXzVgcYPlFO7NFwI8Yt7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIxMyBTYWx0ZWRfXwMLW7EUULqjp
 pCMoRzWBoh+4974iCQEDlZqufstz4w8EtIzWFU2Qr5kxINF9/zPm+3omP3CM31thBHvOQkVt8YY
 8s6HbfiRm5xolJRL82ZqKR4qnyyeTs+5VypDcJxF8KZ5akfunIjvlEBlY+18/e8iOAmsYvAv80C
 I+XhOljWFc5y/XONKCpwFqzpvl1jzssdjat/1M5fJEBPdbLXj7Gfdweh84y7/VawPsRfTxLi6y3
 5dkr74j9JrjvfrPG7S+g+jZAzLm841/WIgGTYxj1/RDWMicQF+KnieB0Ai2Do1+uWThz6hHdhbs
 ejg+goXBVjMkTRTKb4wxgpDBmhf2sn4bizKuXqhv9kGGL3yGnPIb/saA/CcoPgcFibI06frXtIu
 APhKAzSYo8HCQ9VXcDVFoihjtko54An2J9DLh55Zb6C6J4+FsxJWVUU3f00IkqRY34YA90J8wde
 buQ8Kf6MBGrYU8jSm2A==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e7ebbc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=b7LFBttVh2RoOqfkFZAA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604210213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_142727_488995_317DBFDA 
X-CRM114-Status: GOOD (  27.24  )
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

On 4/21/2026 10:25 AM, Yu-Hsiang Tseng wrote:
> Two functions in ath12k assert that the caller holds an RCU read lock:
> ath12k_mac_get_arvif() and ath12k_p2p_noa_update_vdev_iter(). Both use:
> 
>     WARN_ON(!rcu_read_lock_any_held());
> 
> On PREEMPT_RT kernels built with CONFIG_PROVE_RCU=n, this produces a
> false positive splat whenever these functions are invoked from paths
> that do hold the RCU read lock (e.g. firmware stats processing or
> mac80211 interface iteration).
> 
> Root cause:
> 
>   - On !PROVE_RCU, rcu_read_lock_any_held() is a static inline that
>     returns !preemptible() as a proxy for "in an RCU read section".
> 
>   - On PREEMPT_RT, rcu_read_lock() does not disable preemption. A
>     task can therefore be preemptible while legitimately holding an
>     RCU read lock.
> 
>   - Callers such as ath12k_wmi_tlv_rssi_chain_parse() (via guard(rcu)())
>     and ieee80211_iterate_active_interfaces_atomic() do hold the RCU
>     read lock, so these warnings are incorrect.
> 
> Typical splat seen on a WCN7850 station with periodic fw stats
> processing:
> 
>   WARNING: drivers/net/wireless/ath/ath12k/mac.c:791 at
>     ath12k_mac_get_arvif+0x9e/0xd0 [ath12k]
>   Tainted: G W O 6.19.13-rt #1 PREEMPT_RT
>   Call Trace:
>    ath12k_wmi_tlv_rssi_chain_parse+0x69/0x170 [ath12k]
>    ath12k_wmi_tlv_iter+0x7f/0x120 [ath12k]
>    ath12k_wmi_tlv_fw_stats_parse+0x342/0x6b0 [ath12k]
>    ath12k_wmi_op_rx+0xe9e/0x3150 [ath12k]
>    ath12k_htc_rx_completion_handler+0x3df/0x5b0 [ath12k]
>    ath12k_ce_per_engine_service+0x325/0x3e0 [ath12k]
>    ath12k_pci_ce_workqueue+0x20/0x40 [ath12k]
> 
> Replace the WARN_ON() with RCU_LOCKDEP_WARN(), which is gated on
> debug_lockdep_rcu_enabled() and therefore compiles out entirely
> when PROVE_RCU is disabled. PROVE_RCU kernels continue to get the
> full lockdep-based check.
> 
> Fixes: 3dd2c68f206e ("wifi: ath12k: prepare vif data structure for MLO handling")
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Note that Tested-on: is not a official upstream tag, it is an ath-specific
tag. Since it is not an official tag, it should be specified separately from
the official tags:

<commit text>
<blank line>
Tested-on: ...
<blank line>
<official upstream tags>
Signed-off-by: ...

Unless there are are other review comments there is no need to send a v3 to
address this -- I can make this change when I pick up the patch.

> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Yu-Hsiang Tseng <asas1asas200@gmail.com>
> ---
> Changes in v2:
>   - Also fix the same WARN_ON() in ath12k_p2p_noa_update_vdev_iter()
>     (suggested by Baochen Qiang)
>   - Update commit message to cover both call sites

Note that you made v2 In-reply-to the v1 patch. In kernel.org code review that
is NOT preferred. In kernel.org it is preferred that each version of a patch
be a separate thread.

> 
> Link to v1: https://lore.kernel.org/ath12k/20260420161049.695518-1-asas1asas200@gmail.com/
> 
>  drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
>  drivers/net/wireless/ath/ath12k/p2p.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index fbdfe6424fd7..a772a5b6adc9 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -788,7 +788,8 @@ struct ath12k_link_vif *ath12k_mac_get_arvif(struct ath12k *ar, u32 vdev_id)
>  
>  	/* To use the arvif returned, caller must have held rcu read lock.
>  	 */
> -	WARN_ON(!rcu_read_lock_any_held());
> +	RCU_LOCKDEP_WARN(!rcu_read_lock_any_held(),
> +			 "RCU read lock not held");
>  	arvif_iter.vdev_id = vdev_id;
>  	arvif_iter.ar = ar;
>  
> diff --git a/drivers/net/wireless/ath/ath12k/p2p.c b/drivers/net/wireless/ath/ath12k/p2p.c
> index 59589748f1a8..caa92612372b 100644
> --- a/drivers/net/wireless/ath/ath12k/p2p.c
> +++ b/drivers/net/wireless/ath/ath12k/p2p.c
> @@ -123,7 +123,8 @@ static void ath12k_p2p_noa_update_vdev_iter(void *data, u8 *mac,
>  	struct ath12k_p2p_noa_arg *arg = data;
>  	struct ath12k_link_vif *arvif;
>  
> -	WARN_ON(!rcu_read_lock_any_held());
> +	RCU_LOCKDEP_WARN(!rcu_read_lock_any_held(),
> +			 "RCU read lock not held");
>  	arvif = &ahvif->deflink;
>  	if (!arvif->is_created || arvif->ar != arg->ar || arvif->vdev_id != arg->vdev_id)
>  		return;


