Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ED7C27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 21:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+XEv25AeEXOCbpq7xrT/sJI7wsH9BqIwKNpiXTJkYA=; b=mY6mw+/YiEo6Ivk0N7JSKfatyA
	BYPH/5GtLQu07V9xY2ThrI1iGPq3328m4Iw1RmLExXKhG9oO1eCQFJktCJK3b4Br5XcL0K5CAeNuS
	bHaZzDLRMUxMz/iMYaZBsT6Q7Mx8mN4R/Lz4dlL6R1OkR9mdrWPJeTbz0Bq/Nbldmbq8hCb1+2Vxo
	LYUiI3NYnLI2syfGF60Frc6CD2lGsqXRwZ85HmdS/hQydINDcscTtfdEXOCMtu/ASgXAajyi/DJ4N
	sSyLQ4oo4mKIf6qNF8LMD9Eax1QXKFaRR6iR5MhisCF9dF3hWqG9jiS6cDfaGwP0tpKxPFNZIzCKh
	4n/5kueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJK6C-0000000CiQh-2iW4
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 21:41:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJK68-0000000CiQ2-0ewJ
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 21:41:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HHwINC014938;
	Mon, 17 Jun 2024 21:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+XEv25AeEXOCbpq7xrT/sJI7wsH9BqIwKNpiXTJkYA=; b=iJoD4/BSLWpP3Vl7
	HWJ5qErR43RLUsSmco7NtZKFkiRMFDy7I6QPpZxlegDDXcN9VEqfWDI2lEilqYtn
	2W01zNbt7MSQtRWq4yHz0TQEEjh3apCe0BwlkfP5KOIoD+UnHsUU2AH03gP71i6z
	/0uJIwaq9T9uhQU3m2pbUPy/UOO5+fX/3aQ+sCviC+Mr6BwLtddO5VKwBRAi/JRc
	pOeQgj28doq8qnJh58KvKCY9vBhjiiWDeWJu76INEsKO+Sluv3UD+el0acWoaxrO
	u8/X1eW+mM5fHveVOmkARFEw6YrUQaMOJkaCZnQIMKseTgtPu+iAbmfDwYaBRSl5
	61J/HA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytt0trghh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 21:41:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HLf5tw004757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 21:41:05 GMT
Received: from [10.48.243.231] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 14:41:05 -0700
Message-ID: <65ec9320-4286-4470-af7a-e00932713475@quicinc.com>
Date: Mon, 17 Jun 2024 14:41:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Fill pdev id for fw test cmd
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
References: <20240617052903.2720292-1-quic_aarasahu@quicinc.com>
 <20240617052903.2720292-5-quic_aarasahu@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240617052903.2720292-5-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vaHxfuZzNMLlCEDnR9Pn0ZM9K4lgHlp3
X-Proofpoint-GUID: vaHxfuZzNMLlCEDnR9Pn0ZM9K4lgHlp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_144108_373040_B301D937 
X-CRM114-Status: GOOD (  16.16  )
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

On 6/16/2024 10:29 PM, Aaradhana Sahu wrote:
> From: Rajat Soni <quic_rajson@quicinc.com>
> 
> Currently pdev id is not set properly that can cause crash

s/properly that/properly. That/
s/cause crash/cause a crash/

> if pdev id is not equal to the pdev id when firmware test
> command is run during AP bring up or ping.
> 
> Set pdev id in function ath12k_tm_cmd_wmi to resolve this
> issue.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> Co-developed-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/testmode.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/testmode.c b/drivers/net/wireless/ath/ath12k/testmode.c
> index aa9904de296f..f81564a4e6de 100644
> --- a/drivers/net/wireless/ath/ath12k/testmode.c
> +++ b/drivers/net/wireless/ath/ath12k/testmode.c
> @@ -320,9 +320,10 @@ static int ath12k_tm_cmd_wmi(struct ath12k *ar, struct nlattr *tb[])
>  {
>  	struct ath12k_wmi_pdev *wmi = ar->wmi;
>  	struct sk_buff *skb;
> -	u32 cmd_id, buf_len;
> -	int ret;
> +	struct wmi_pdev_set_param_cmd *cmd;
> +	int ret, tag;
>  	void *buf;
> +	u32 cmd_id, buf_len;
>  
>  	mutex_lock(&ar->conf_mutex);
>  
> @@ -347,6 +348,12 @@ static int ath12k_tm_cmd_wmi(struct ath12k *ar, struct nlattr *tb[])
>  
>  	cmd_id = nla_get_u32(tb[ATH_TM_ATTR_WMI_CMDID]);
>  
> +	cmd = buf;
> +	tag = le32_get_bits(cmd->tlv_header, WMI_TLV_TAG);
> +
> +	if (tag == WMI_TAG_PDEV_SET_PARAM_CMD)
> +		cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
> +
>  	ath12k_dbg(ar->ab, ATH12K_DBG_TESTMODE,
>  		   "testmode cmd wmi cmd_id %d  buf length %d\n",
>  		   cmd_id, buf_len);


