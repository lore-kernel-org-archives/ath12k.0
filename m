Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43452C47258
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ocs6VVOtEstn22OywDjnCDoMp9EJ9LgH1g/53J6rB3k=; b=GzYDABKxtegezUk/LuYECmp+tq
	w2GhMn7PT3xTktm3r1+bM6Q0ugpUsDUPuv1ewK9AvEncUoPl/KGwsEqLqCHyl9sZsz0pUe21uUBzX
	TA+37o2/KyItcQTBnTmuN1Z/zdj147jAK2g+BGvPv/Js8btrd1e0QwXggPAfCtoUcSQak/9Kho2NO
	HM/25avRtdEZXq/M5GFgRqKk3DTeGzLDDs+eIQN3EdhbFoXJTh7xlJiI3j6iuL0J1+2l707kekPnE
	T1u6rPdFQnFoTzKs81kaRd6H+Ptcj8eCPve26dN8mKnqApQQeacDkRlf+I4wGqBPsV639KQVmo29/
	4fk6aXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKyS-003Ofw-3B
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 17:05:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKyQ-003OfE-1P
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 17:05:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CFCnNs009142;
	Fri, 12 Jan 2024 17:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ocs6VVOtEstn22OywDjnCDoMp9EJ9LgH1g/53J6rB3k=; b=iN
	zNUiL14IrbhwKRfL+Wo8/bMkDE7ptPomnUri2ErTbBQKtyqA3oJt7fboJWLLOkKL
	BU3WCnLDV8862F8iD0/M3ucPIFiIAeQrkz2B+akiYoGPnVYqaVdWGbAiMgwm5SDH
	e32CsiV+n9PJF/85pjd5KY0fSDs7Ngxfnr4Sjq2ldqGjF977l2ilCzeLhFHjDlPt
	MnQ6iuxw9gAb2WJDqxNrKDkGCm38qReR6IGzakG8wk8pVIJYh/1ajKpiPJvZVGwK
	FjxJkJQkxKPSi94HmbsVpbgxa/I/E+tQUy/Dj8BYYDbTHezUvzjEVHZIXUOBNJjI
	a9dJ885XA2Dr4lHuzFTw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjpuj2mfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:05:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CH5bKf014143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:05:37 GMT
Received: from [10.110.16.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 09:05:36 -0800
Message-ID: <7b671721-054e-4caa-a3c8-723b65c24838@quicinc.com>
Date: Fri, 12 Jan 2024 09:05:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] wifi: ath12k: Modify add and remove chanctx ops for
 single wiphy support
Content-Language: en-US
To: Sriram R <quic_srirrama@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
 <20240111045045.28377-3-quic_srirrama@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240111045045.28377-3-quic_srirrama@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OQaAw9DdxlXFgxtu8_npxnFbAIeGt5XY
X-Proofpoint-ORIG-GUID: OQaAw9DdxlXFgxtu8_npxnFbAIeGt5XY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=470 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_090538_484707_27424A63 
X-CRM114-Status: UNSURE (   7.17  )
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

On 1/10/2024 8:50 PM, Sriram R wrote:
> Modify add and remove chanctx mac80211 ops to fetch the correct
> radio(ar) based on channel context.
> 
> This change also introduces new helper function to fetch the
> radio/ar based on channel context and ieee80211_chan which internally
> uses the radio's low/high freq range.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


