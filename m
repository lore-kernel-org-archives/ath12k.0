Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B34C28D13
	for <ath12k@archiver.kernel.org>; Mon, 22 Aug 2022 17:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCfI8Rf6XmIjPZgAgJQkm4Lv0k1AzyFVB7QuDt9gz/w=; b=LK4/xL3khIF8dx
	j8SvyAPB5dZ2sxBX85FGbbZosUIC5jCcXjynBU2bdaOBk6fETOwRsuV+LRA33rfII7RwSUYzH/kBR
	2ZT/NddCfYrVAHs6XrNH7XEOQG7v7I/QpmDqlhSA/zUZIAdPg8PZUfQJe8/vTI6NBlirYx+VQUQfw
	4C+lCtv+qGHcEkHZsR7iqb2xJ415WS0rEQ1j7owr0+D2jPv9JE1FZdEPKVVNZ/UokiToyC4mlDyDn
	5AUJt4MNHmPE+7w8Zsx9WkIitpZM2NpOMLCu0Oc2hOznMQGYEVbOjcnESqyfuylxUykNve59T1GJi
	yKSvoj1CJY0v61BEHzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQB0Y-00Cyub-VZ
	for ath12k@archiver.kernel.org; Mon, 22 Aug 2022 17:14:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQB0Q-00CypJ-Cy
	for ath12k@lists.infradead.org; Mon, 22 Aug 2022 17:14:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27MFLtTA009184;
	Mon, 22 Aug 2022 17:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YHXKYbZDB+SQmGwa9x657Bpwt9sf1252DVx+CGaF/1k=;
 b=Wq4UU6GaYl+QePCczhdwGxbtarSwy5ATVBmESk4mc2gS3xoRJbl8M8VlmITdXUu8pLyw
 N61Mkw+OuyLkPD169xGBW/XvrSjR+dQlskEsgVvSb2gRG+7NAWn4QG8oxEQJgUbNQDlS
 qI7tcYkVH3tpCHAaiWF5+f1CRRRcg2wEuf7gUL0OJfSngyp9WMwmHsrEvMvbcy0/OGxa
 3R/bVssfcFCtFnst/uWckguQGbSq4G71WKhm+GnIsnhDSTf0b02Ub1auvltj1tNRBbdP
 aloWb+oCNMOYNqKeEFmCN6bosOT1/9W5rC596Ji65XQyLZQZCFKVwxNz08nMNpuBxbpX kA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j2vwhw8q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 17:14:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27MHEMVD028380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 17:14:22 GMT
Received: from [10.110.115.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 22 Aug
 2022 10:14:21 -0700
Message-ID: <30a097d8-d084-2a1e-f067-bb7a303968da@quicinc.com>
Date: Mon, 22 Aug 2022 10:14:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 39/50] wifi: ath12k: add qmi.c
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-40-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-40-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7xOfya9UmTbcT4CE_-TA8jbOvXXQc5h8
X-Proofpoint-GUID: 7xOfya9UmTbcT4CE_-TA8jbOvXXQc5h8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_101430_507163_1EE089D0 
X-CRM114-Status: GOOD (  12.87  )
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
>   drivers/net/wireless/ath/ath12k/qmi.c | 3305 +++++++++++++++++++++++++++++++++
>   1 file changed, 3305 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
[...]
> +static struct qmi_elem_info qmi_wlfw_qdss_trace_config_download_req_msg_v01_ei[] = {

FYI I've submitted a patch which will allow these to be const:
<https://lore.kernel.org/linux-arm-msm/20220822153435.7856-1-quic_jjohnson@quicinc.com/T/#u>

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
