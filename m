Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34677C00140
	for <ath12k@archiver.kernel.org>; Thu, 18 Aug 2022 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWjtGCUm2qoUM7Mz0i5zYL2AlSU2ru7fOSMY24XJjzU=; b=BS5PtWEOUS2hiW
	F2fI7ncD2KBpIgjxps8ULbHLOad2KnhatIvBkuMRbiZsyccqJgyXzfJCIZuK6x1qbyCB38ZP7DN4F
	HYiaAP1dne1mOKuyts6H/3XBUHAiv9U07twXs6JlUtwZTaMqI7GssntNsrtM5wLRXytbGuFDF4YaB
	39D+2ADp5omb1P0I7EVsplh0F7/MD2XbVqF/06hAyUfSsAstXMLk7bUz+BNEnXYHuGj0UnyqNLiVe
	n127x0b9g0sqVAWiNN6Wb35cCOIUz7jo/V/W07Zyh/kSRq5zFiT4RX1SfD0KswZGzNjplFgTG+jlx
	avMTZRyK7f0q6aHf1l/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmnB-009gMZ-In
	for ath12k@archiver.kernel.org; Thu, 18 Aug 2022 21:11:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmn5-009gLZ-IW
	for ath12k@lists.infradead.org; Thu, 18 Aug 2022 21:11:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IKuWZl002875;
	Thu, 18 Aug 2022 21:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=p6enczkGghM1lldbfNj5si3H4rzLzMZ4iCbsyRb+PQQ=;
 b=QYMA+e2gtH5tBNa3cu9L5EA5zqZDibr0xlZAart+oKeayLxtHLLXUTQ5bAvRhQw7nvtw
 1PsiXM8rZXuccsftGNO/75XH/xpUuysGhDX4vgBjsYh5F/f5gmwwWPV1vqFZbU+odDNr
 p9y12yKJL6ik5ZHCFAcguzBgcOULFsEg+q1+wQXFz0C0/iGlQuIrbIiGk4MfmUH8HiIF
 rvHzLNHRId8ffYdIB8Y6jFZNh7Cn6GA4P6Yb2+5SdXr8ZBcMszqJKUaSwYnmNIVOoKf6
 p1ZnBacMPTGb6b+Keou9rUo7UQsSgtbiVjJfEnGe7B9WoADEBzw9tKeI57YSj+f/8poB GA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j1ttq8cvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 21:10:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27ILAseB006022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 21:10:54 GMT
Received: from [10.110.11.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 14:10:54 -0700
Message-ID: <b46f6c1c-0b3d-0960-b655-46567ede41d0@quicinc.com>
Date: Thu, 18 Aug 2022 14:10:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 28/50] wifi: ath12k: add htc.h
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-29-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-29-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cYB2dDpNSM3NXEi3_2B0y4YPKS0rMnzc
X-Proofpoint-ORIG-GUID: cYB2dDpNSM3NXEi3_2B0y4YPKS0rMnzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_16,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxscore=0 mlxlogscore=895
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_141059_686515_8EFA32F2 
X-CRM114-Status: GOOD (  19.94  )
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
>   drivers/net/wireless/ath/ath12k/htc.h | 311 ++++++++++++++++++++++++++++++++++
>   1 file changed, 311 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/htc.h b/drivers/net/wireless/ath/ath12k/htc.h

snip

> +#define ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_MASK GENMASK(1, 0)
> +#define ATH12K_HTC_CONN_FLAGS_RECV_ALLOC GENMASK(15, 8)
> +
> +enum ath12k_htc_conn_flags {
> +	ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_ONE_FOURTH    = 0x0,
> +	ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_ONE_HALF      = 0x1,
> +	ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_THREE_FOURTHS = 0x2,
> +	ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_UNITY         = 0x3,

it seems strange to call a 2-bit field a flag

> +	ATH12K_HTC_CONN_FLAGS_REDUCE_CREDIT_DRIBBLE    = 1 << 2,
> +	ATH12K_HTC_CONN_FLAGS_DISABLE_CREDIT_FLOW_CTRL = 1 << 3
> +};

and it seems strange to have an enum which incorporates the values of 
the ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_MASK along with definitions of 
other mask flags.

perhaps these would be more logically defined as macros just after 
ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_MASK:
#define ATH12K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_MASK GENMASK(1, 0)
#define ATH12K_HTC_CONN_FLAGS_REDUCE_CREDIT_DRIBBLE BIT(2)
#define ATH12K_HTC_CONN_FLAGS_DISABLE_CREDIT_FLOW_CTRL BIT(3)

and then rename ath12k_htc_conn_flags to be more specific that it just 
has threshold level values?

> +
> +enum ath12k_htc_conn_svc_status {
> +	ATH12K_HTC_CONN_SVC_STATUS_SUCCESS      = 0,
> +	ATH12K_HTC_CONN_SVC_STATUS_NOT_FOUND    = 1,
> +	ATH12K_HTC_CONN_SVC_STATUS_FAILED       = 2,
> +	ATH12K_HTC_CONN_SVC_STATUS_NO_RESOURCES = 3,
> +	ATH12K_HTC_CONN_SVC_STATUS_NO_MORE_EP   = 4
> +};
> +
> +struct ath12k_htc_ready {
> +	__le32 id_credit_count;
> +	__le32 size_ep;
> +} __packed;
> +
> +struct ath12k_htc_ready_extended {
> +	struct ath12k_htc_ready base;
> +	__le32 ver_bundle;
> +} __packed;
> +
> +struct ath12k_htc_conn_svc {
> +	__le32 msg_svc_id;
> +	__le32 flags_len;
> +} __packed;
> +
> +struct ath12k_htc_conn_svc_resp {
> +	__le32 msg_svc_id;
> +	__le32 flags_len;
> +	__le32 svc_meta_pad;
> +} __packed;
> +
> +struct ath12k_htc_setup_complete_extended {
> +	__le32 msg_id;

is there a reason this isn't msg_svc_id to be consistent with the other 
htc messages?

or even have every htc msg begin with a struct ath12k_htc_msg hdr?

perhaps also consider some naming conventions similar to what were 
adopted for WMI?

> +	__le32 flags;
> +	__le32 max_msgs_per_bundled_recv;
> +} __packed;
> +
> +struct ath12k_htc_msg {
> +	__le32 msg_svc_id;
> +	__le32 flags_len;
> +} __packed __aligned(4);
> +
> +enum ath12k_htc_record_id {
> +	ATH12K_HTC_RECORD_NULL    = 0,
> +	ATH12K_HTC_RECORD_CREDITS = 1
> +};
> +
> +struct ath12k_htc_record_hdr {
> +	u8 id; /* @enum ath12k_htc_record_id */
> +	u8 len;
> +	u8 pad0;
> +	u8 pad1;
> +} __packed;
> +
> +struct ath12k_htc_credit_report {
> +	u8 eid; /* @enum ath12k_htc_ep_id */
> +	u8 credits;
> +	u8 pad0;
> +	u8 pad1;
> +} __packed;
> +
> +struct ath12k_htc_record {
> +	struct ath12k_htc_record_hdr hdr;
> +	union {
> +		struct ath12k_htc_credit_report credit_report[0];
> +		u8 pauload[0];

s/pauload/payload/?

s/[0]/[]/ per 
<https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays>

> +	};
> +} __packed __aligned(4);
> +
> +/* note: the trailer offset is dynamic depending
> + * on payload length. this is only a struct layout draft
> + */
> +struct ath12k_htc_frame {
> +	struct ath12k_htc_hdr hdr;
> +	union {
> +		struct ath12k_htc_msg msg;
> +		u8 payload[0];

s/[0]/[]/

> +	};
> +	struct ath12k_htc_record trailer[0];


s/[0]/[]/

but this struct makes no sense. you can't have a variable-length payload 
that isn't at the end of the struct

if this is just supposed to be some sort of pseudo-documentation then 
perhaps put it in a comment so that the compiler won't see this?

or perhaps even better draw an ASCII representation?

> +} __packed __aligned(4);

rest snipped

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
