Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1F8C25B78
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 14:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDspf0p2k5q7bRCR/liptApO+/U415+F420jvBbe6lk=; b=fKBoLAsyaqLvx2qB8x9rckW2fz
	IMota/aL3II9GtzEWXZuDgi9JVoUh5BVn9x+52dnAYcB0eRZsNlCy0/j8z1Xo42dmlsS+QyjEn0HM
	PKpgcAcbPfmBMVJVmsrBGkY3p9TipwXiy4WC3/efpZyyl3FV0niE1s7OZMuY54lzbH8Ve7EHBijyN
	Zx40Weg4rBYBfjz3QIFUfkt7EWP8xqE7F9z+FHiINthq5n2ILeD8gGD3HpcsC77nWOUJq68hNQ2cz
	fDArdCd+PhaNTbjylTb6BnVyQOLdrjQ+h3cOxUHJyUYUcCWrVAc1I0l07+FOUSfUtgHkqa1wHXgIX
	vJur7b9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEVbs-00000002q2m-1w0x
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 14:58:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEVbp-00000002q20-1CYQ
	for ath12k@lists.infradead.org;
	Tue, 04 Jun 2024 14:57:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4549vCWR010196;
	Tue, 4 Jun 2024 14:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDspf0p2k5q7bRCR/liptApO+/U415+F420jvBbe6lk=; b=GFG1IXDLqsjAgBOk
	iTQuG8k4bE8Ya8oROFEpFz6GMw3WiHHLGKjcpAE5vSLT0qLkvGjmRA2FEGm63Jtm
	lZ+rcAjKv7ydEjokY7FXKkx9lKZMbtC1hk3bYwdmb0JsiqTG0EvkQys3fFQpR7BY
	ooteNyOIWsVrvT8toOAr3jsgslvJ8CK1qwm478sfcnI/dEPAs8wHmFZnZOsHRou5
	fpmvSYzhDRIWC5fnNWz8asnbUShKLI2Ahg8qinY39rhA/sq8Pr2kKfaD5OyfBl9Z
	+4Rd/Bt9BnkIEqrYEItmw8GIGBJuRT0Xu3Y/glf4ojKLN/eGTFQjyUCqRynHyvVq
	ZzxjIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw6v779x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 14:57:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454EvtnK022802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 14:57:55 GMT
Received: from [10.48.241.109] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 07:57:55 -0700
Message-ID: <cfea843e-be05-48eb-9a84-c58bdb3b77b1@quicinc.com>
Date: Tue, 4 Jun 2024 07:57:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] wifi: ath12k: support GTK rekey offload
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240604055407.12506-1-quic_bqiang@quicinc.com>
 <20240604055407.12506-8-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240604055407.12506-8-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z4TWxwmAg-W0NAhX5Sm5FIpzPnZZ4cnF
X-Proofpoint-ORIG-GUID: Z4TWxwmAg-W0NAhX5Sm5FIpzPnZZ4cnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 mlxlogscore=662 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406040119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_075757_388432_93290EE3 
X-CRM114-Status: UNSURE (   6.53  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 6/3/2024 10:54 PM, Baochen Qiang wrote:
> Host sets GTK related info to firmware before WoW is enabled, and
> gets rekey replay_count and then disables GTK rekey when WoW quits.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


