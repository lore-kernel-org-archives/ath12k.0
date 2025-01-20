Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20191C02185
	for <ath12k@archiver.kernel.org>; Mon, 20 Jan 2025 04:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWzMHlPn3VC72fXyMVRYsKeoolsM9U62ug52tRfgWM0=; b=ahpLpcshCeNLbAGiQQZz9a7Lic
	sRdDAjPLLIEydHDA307I93OiSessDstF1iRxzrZNfllIA16W2bmPzQ/+ccizEMmjaUfoDH7eGacMX
	OF4vAKLvfj4ohZ6Hchwj0cX9s6M2AYElCBwnAjKW2JS3noXyXsJ8LOsMgLK6iThBZZq0GrhlZvSS5
	p3JIkh+cqicQFfUZsRlOGHEDvhJGV683qBrveW3Kt/2hhTbXJAmll5/E0rUFTTEtg7tLHuwZwdePw
	DgP+WhtZr5GY2pj9uWsW51JsEHq0yPokKfwGCd1ia8EOMbqCeU/UDdjUDDd5F4bznzmFerL5RErB7
	Xcdh0D+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZjAJ-00000004h40-3gE5
	for ath12k@archiver.kernel.org;
	Mon, 20 Jan 2025 04:13:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZjAI-00000004h3d-0DUh
	for ath12k@lists.infradead.org;
	Mon, 20 Jan 2025 04:13:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JNVOdM026495;
	Mon, 20 Jan 2025 04:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWzMHlPn3VC72fXyMVRYsKeoolsM9U62ug52tRfgWM0=; b=O2d7xlLIwVMe5V9H
	eckU/wo2mOXHPs2/zK9/+1fXAiWhJ0fEhIsYt4dGR/2FZwvByaAE7vrwG8ja9rgW
	rC6e7YMZP5Nig33i29EMjHyFO3odVHyCaKG5eTvEl2SGFQrYtdPM7bJh6iuK1WZR
	J7JJUKcfW0k+qMIp9Ej9BsUWiyKjp8lnEu1N4W6RTOEuVJWuSAvu7rvvilaYpHgN
	S+MwMLa15ZWgU05Uu42gx+5iv2x7iQXxdEkw3IZzbhRpKq8/DCJSre4A0ytnjs9y
	shK8Nnb2AmHC27TNHEwkV/uYwEhsiraiJerNtSm5w1cRhe++cUOAWh3wI5zrvGSd
	DLRBDw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448wnf19au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 04:13:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K4DR55010329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 04:13:28 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 19 Jan
 2025 20:13:26 -0800
Message-ID: <8b58d736-7518-4a2b-be75-74956fe46a2f@quicinc.com>
Date: Mon, 20 Jan 2025 09:43:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] wifi: ath12k: Disable MLO in Factory Test Mode
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
 <20250119083657.1937557-5-quic_aarasahu@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20250119083657.1937557-5-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v9rEgfKpdqnZaLGm8PcdC9_-KgqflFEN
X-Proofpoint-ORIG-GUID: v9rEgfKpdqnZaLGm8PcdC9_-KgqflFEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=793
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_201330_283575_F29B31B6 
X-CRM114-Status: UNSURE (   6.17  )
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

On 1/19/25 14:06, Aaradhana Sahu wrote:
> Factory test mode(FTM) is supported only in non-MLO(multi-link operation)
> mode. Therefore, disable MLO when driver boots in FTM mode.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu<quic_aarasahu@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <quic_adisi@quicinc.com>


-- 
Aditya

