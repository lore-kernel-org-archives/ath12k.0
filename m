Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E123C61D90
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 16:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCBEGKHOyyvbdtzafEj95/x9tndvslwUJlmcyPH+Ivs=; b=qkxx3DM2K/o45B
	YSQUvQYZWF6ew2Dz9enwjEnZXaNvk4PQLU3alfamP0yE4fvPa7W94+baUcJUZmAoCoB4BJtFXMeiA
	lHDYHAUnHZKO84Wg97czrGuOfQqy6eWOWDcjmqN1uNGpHk5mpj8HQyiC2DPSIso9FiXi2G7P1b7PH
	NPn7cmcwddLGVpIZh7Hfyav+7Nm1hvlR9IX2RJkc6LSOYHILwWbKP/KirsTKqRmkrfHrdM5m3E+x8
	Q4pPhE/+iK3Z/TyDznvNFeR1QM8FB7z3IHYEGYgCCe08GEJCTRXiYWk+59F0hiJvISdBtiDZY4eUt
	Pk7F1VRrt8aaCVAlygGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TH1-00HF1x-0V
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 16:06:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TGx-00HF0x-3B
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 16:06:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALFa24H012812;
	Tue, 21 Nov 2023 16:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vomoxso1cL3TECbKmSfxDi3llIasSw59bIrMTb3E0PY=;
 b=HzIz86z8T+9znsbRXfJFBX99boXxXO/BxIDxOsNqVfMy3hXynMrMihV+iNRUbfhCFnEg
 e6IRERdebOe+W9U36IoE3hgXwPzXI7SxY3PXNExVyG4gDY1lgoOWYMhlZoNjXsXnwe53
 InKZVNmxb3JexiGCBxWoiejVDkAzPzkfq5sPu38SOwYtlMl4iP3m/Q0ryEyxJnAI7jnK
 0yCTqubmg6slTxGs35dVzSSIm4UBiYmYA1kxYx5Il6c0Cs2coUKeDtPf1A/ANlXqRzjj
 ZWqUf+y6JFmOV46zuFB/QdAGYAzjk6WgZqe5dI2XBaR20QOXXEsxNZafiOmYzq+7c8uV Qw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugyb482pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:06:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALG6iLY010097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:06:44 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 21 Nov
 2023 08:06:43 -0800
Message-ID: <f456ef93-f059-4b69-9c50-8ffcca62f321@quicinc.com>
Date: Tue, 21 Nov 2023 08:06:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] wifi: ath12k: add CE and ext IRQ flag to indicate
 irq_handler
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231121021304.12966-1-quic_kangyang@quicinc.com>
 <20231121021304.12966-3-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231121021304.12966-3-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZZ5n50VhCNbCSAztzRynWMCabR9oAblD
X-Proofpoint-ORIG-GUID: ZZ5n50VhCNbCSAztzRynWMCabR9oAblD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_09,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxlogscore=260
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_080648_031511_2DEF59F8 
X-CRM114-Status: GOOD (  10.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/20/2023 6:12 PM, Kang Yang wrote:
> Add two flags to indicate whether IRQ handler for CE and DP can be called.
> This is because in one MSI vector case, interrupt is not disabled in
> hif_stop and hif_irq_disable. So if interrupt is disabled, MHI interrupt
> is disabled too.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
