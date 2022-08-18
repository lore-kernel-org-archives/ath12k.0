Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE61BC00140
	for <ath12k@archiver.kernel.org>; Thu, 18 Aug 2022 19:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAaQ3TVR7yg04HTfzst2+GL3zMUTttxzuPYxBGMr5yw=; b=r/m9oiokaKm2h9
	szpEQ/YeNmpqRpOrrjmPksnDVciKfS/z5nHyCbPkkrh7Y+HPauYoIVczNgNrYeKcFCu9BetmyLJOi
	/zM6oQ89K5NoeTUpswgUt3pIj9c8EiIZI0296kp7o7dYx/TgBzWUgBW9mxS148F2bNosFVZJ4fqOz
	eMntG3ZoLmjx0brKyP1NrTZ0CCXsfKJziKTWmE0+DlE8KhPl7YfyiEKHOUETE0E+5ZHCFXzIh2dly
	OVA/ts/FPPFO0eiyClPkqSVCrgiSpg0jKKQm+lsoJl30VoT15PlFem9mvS0AZ6pqe2DT/+FSmEhj+
	ONNDemGaqpweY5H7CQgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOlGX-008evt-6R
	for ath12k@archiver.kernel.org; Thu, 18 Aug 2022 19:33:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOlGT-008eiF-Tq
	for ath12k@lists.infradead.org; Thu, 18 Aug 2022 19:33:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IH8wDV029356;
	Thu, 18 Aug 2022 19:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tiaO5wAkOZaltS8Kv1W+zxw75ASGHi2FprBar7GebA8=;
 b=QtvP35ECVMo1rrFiBGNBLCdQCp9FOeyC5yVBG8JNHs5RVEDKRcKsYvoFMy2PalJ5uuCm
 8Fw3ypwVkmQTYTydHFS/Y2wXmJE5/V0OumQsCg6F8ssjjueh72ecuVxPyRNY4t2/2yRj
 mIbk5yOB9rVhj/v1Xsku5JW/LVhpactLovUCYxrjMf+dBezcxKkKsGrM+0DPufeUltWj
 Iht02Y0XXtkkSyXuzz52J//lx6QrUVjI/ITQ5yke83uDZmb128hZV3B6c2yXSufNHWfZ
 YGemmT44vokbV2Q4vnIxJ74tgYSaxbwEZVMDDcXWY14Ly+lQj4xR9I4d9Yn+1XoLTci4 dw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j1sjr0jcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 19:33:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27IJX7WT024124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 19:33:07 GMT
Received: from [10.110.11.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 12:33:06 -0700
Message-ID: <8ebc4b7e-6b65-8443-eac6-13b940337166@quicinc.com>
Date: Thu, 18 Aug 2022 12:33:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 27/50] wifi: ath12k: add htc.c
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-28-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-28-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i3zuArDT8p8m6jc8imCx92zhn_LtXP9S
X-Proofpoint-GUID: i3zuArDT8p8m6jc8imCx92zhn_LtXP9S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_14,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_123314_155146_F01CE8D8 
X-CRM114-Status: GOOD (  22.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/12/2022 9:09 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/htc.c | 789 ++++++++++++++++++++++++++++++++++
>   1 file changed, 789 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/htc.c b/drivers/net/wireless/ath/ath12k/htc.c

snip

> +static struct sk_buff *ath12k_htc_build_tx_ctrl_skb(void *ab)

why void * instead of struct ath12k_base *?

> +{
> +	struct sk_buff *skb;
> +	struct ath12k_skb_cb *skb_cb;
> +
> +	skb = dev_alloc_skb(ATH12K_HTC_CONTROL_BUFFER_SIZE);
> +	if (!skb)
> +		return NULL;
> +
> +	skb_reserve(skb, sizeof(struct ath12k_htc_hdr));
> +	WARN_ON_ONCE(!IS_ALIGNED((unsigned long)skb->data, 4));
> +
> +	skb_cb = ATH12K_SKB_CB(skb);
> +	memset(skb_cb, 0, sizeof(*skb_cb));
> +
> +	ath12k_dbg(ab, ATH12K_DBG_HTC, "%s: skb %pK\n", __func__, skb);

does this log really serve any useful purpose?

> +	return skb;
> +}
> +

snip

> +static u8 ath12k_htc_get_credit_allocation(struct ath12k_htc *htc,
> +					   u16 service_id)
> +{
> +	u8 i, allocation = 0;
> +
> +	for (i = 0; i < ATH12K_HTC_MAX_SERVICE_ALLOC_ENTRIES; i++) {
> +		if (htc->service_alloc_table[i].service_id == service_id) {
> +			allocation =
> +				htc->service_alloc_table[i].credit_allocation;

should you break from the loop here, or can there be more/bigger 
allocations for the same service id?

> +		}
> +	}
> +
> +	return allocation;
> +}
> +
> +static int ath12k_htc_setup_target_buffer_assignments(struct ath12k_htc *htc)
> +{
> +	struct ath12k_htc_svc_tx_credits *serv_entry;
> +	u32 svc_id[] = {

static const?

> +		ATH12K_HTC_SVC_ID_WMI_CONTROL,
> +		ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1,
> +		ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC2,
> +	};
> +	int i, credits;
> +
> +	credits = htc->total_transmit_credits;
> +	serv_entry = htc->service_alloc_table;
> +
> +	if ((htc->wmi_ep_count == 0) ||
> +	    (htc->wmi_ep_count > ARRAY_SIZE(svc_id)))
> +		return -EINVAL;
> +
> +	/* Divide credits among number of endpoints for WMI */
> +	credits = credits / htc->wmi_ep_count;
> +	for (i = 0; i < htc->wmi_ep_count; i++) {
> +		serv_entry[i].service_id = svc_id[i];
> +		serv_entry[i].credit_allocation = credits;
> +	}
> +
> +	return 0;
> +}
> +

snip

> +int ath12k_htc_start(struct ath12k_htc *htc)
> +{
> +	struct sk_buff *skb;
> +	int status = 0;

nit: initializer always overwritten by ath12k_htc_send()?

> +	struct ath12k_base *ab = htc->ab;
> +	struct ath12k_htc_setup_complete_extended *msg;
> +
> +	skb = ath12k_htc_build_tx_ctrl_skb(htc->ab);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	skb_put(skb, sizeof(*msg));
> +	memset(skb->data, 0, skb->len);
> +
> +	msg = (struct ath12k_htc_setup_complete_extended *)skb->data;
> +	msg->msg_id = le32_encode_bits(ATH12K_HTC_MSG_SETUP_COMPLETE_EX_ID,
> +				       HTC_MSG_MESSAGEID);
> +
> +	ath12k_dbg(ab, ATH12K_DBG_HTC, "HTC is using TX credit flow control\n");
> +
> +	status = ath12k_htc_send(htc, ATH12K_HTC_EP_0, skb);
> +	if (status) {
> +		kfree_skb(skb);
> +		return status;
> +	}
> +
> +	return 0;
> +}
> +
> +int ath12k_htc_init(struct ath12k_base *ab)
> +{
> +	struct ath12k_htc *htc = &ab->htc;
> +	struct ath12k_htc_svc_conn_req conn_req;
> +	struct ath12k_htc_svc_conn_resp conn_resp;
> +	int ret;
> +
> +	spin_lock_init(&htc->tx_lock);
> +
> +	ath12k_htc_reset_endpoint_states(htc);
> +
> +	htc->ab = ab;
> +
> +	switch (ab->wmi_ab.preferred_hw_mode) {
> +	case WMI_HOST_HW_MODE_SINGLE:
> +		htc->wmi_ep_count = 1;
> +		break;
> +	case WMI_HOST_HW_MODE_DBS:
> +	case WMI_HOST_HW_MODE_DBS_OR_SBS:
> +		htc->wmi_ep_count = 2;
> +		break;
> +	case WMI_HOST_HW_MODE_DBS_SBS:
> +		htc->wmi_ep_count = 3;
> +		break;
> +	default:
> +		htc->wmi_ep_count = ab->hw_params->max_radios;
> +		break;
> +	}
> +
> +	/* setup our pseudo HTC control endpoint connection */
> +	memset(&conn_req, 0, sizeof(conn_req));
> +	memset(&conn_resp, 0, sizeof(conn_resp));

is this better than having = {} initializers?

> +	conn_req.ep_ops.ep_tx_complete = ath12k_htc_control_tx_complete;
> +	conn_req.ep_ops.ep_rx_complete = ath12k_htc_control_rx_complete;
> +	conn_req.max_send_queue_depth = ATH12K_NUM_CONTROL_TX_BUFFERS;
> +	conn_req.service_id = ATH12K_HTC_SVC_ID_RSVD_CTRL;
> +
> +	/* connect fake service */
> +	ret = ath12k_htc_connect_service(htc, &conn_req, &conn_resp);
> +	if (ret) {
> +		ath12k_err(ab, "could not connect to htc service (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	init_completion(&htc->ctl_resp);
> +
> +	return 0;
> +}
> 


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
