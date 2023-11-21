Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A67C61D90
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEoRVttCahtVI2LM6FhW7B0Opz0lWAOP36ZgHUHiUxw=; b=eWxyjwVEd+XUUn
	4ft+SjLlI7QDDARoGSlVXWCw2KvdVLmKSBJRup/iid1Tnh07I4TTLp0rIdfxDqGIMopF4baiAP2jp
	zvUan8d/ZWmULwl4eHZj84zetHfk0FEnuXLgiJXppoXmCiTdf+eB+5F/lemRvKR00f+SkuJ+Z7coU
	fSD5FuoFemqKEUNtbMz8ucmiuY+HkGiGqifIP8aa4mySNfmSjVGrxvdjCQ78GMmq8dZQN6K+VD8ng
	vereucwzBESsezuwjPd/z4POeEQhLAY53Kpq2Yoopy+4DBnDmQ2y/q+Kkk6p1/X6kZaK+J+UgBzIL
	9mIQcyeC27amP+v9fCQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5THI-00HF4T-32
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 16:07:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5THG-00HF3v-18
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 16:07:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALEn9rW021557;
	Tue, 21 Nov 2023 16:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4eqInYJAJ2trREiPucyn16IFFOO2T8eOqm98RimJNTo=;
 b=H0SIewSay+AfwY+Y7G1MTUQEZK5j936qL/0dGLi77OkYrTk4NFnE09ZSSmA8TIjqFc9L
 aDPtUYeprpFgBNcrhPVPE2kGV026AldcjqfisNVlrSB7stQGGhThC35LSAzOWuaWmJYn
 hGl9k4AR8QUOINGwHS6G91uhy/3rI8vgIG72C/0h302gIQq7QjFdlIW6VzmHiOprueSL
 9TNfSLV5vqTNjB01ZxP+kiDtJvlenCqNjytev5dRaiE0PXZY8FWatSVGZR1qZO5lLTz2
 amQd4msFTHNyqfeOw2gWkbGuZNYpIX7zyhuMmfdppuq5lclMJ6dTVJG2EpbALtc12zZO Sw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugxn8g6cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:07:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALG74Mp013375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:07:04 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 21 Nov
 2023 08:07:04 -0800
Message-ID: <8a23f9db-2fca-4f92-9191-6dea535fd013@quicinc.com>
Date: Tue, 21 Nov 2023 08:07:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] wifi: ath12k: use ATH12K_PCI_IRQ_DP_OFFSET for DP
 IRQ
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231121021304.12966-1-quic_kangyang@quicinc.com>
 <20231121021304.12966-4-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231121021304.12966-4-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ozaCYBp6TwxsOwnWgC16QNIr1yrMNk1C
X-Proofpoint-GUID: ozaCYBp6TwxsOwnWgC16QNIr1yrMNk1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_09,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 mlxlogscore=534 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_080706_501268_3DE12332 
X-CRM114-Status: UNSURE (   8.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/20/2023 6:12 PM, Kang Yang wrote:
> Like ATH12K_PCI_IRQ_CE0_OFFSET, define ATH12K_PCI_IRQ_DP_OFFSET for
> DP to save the IRQ instead of base_vector from MSI config.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
