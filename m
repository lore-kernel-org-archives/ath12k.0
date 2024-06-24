Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A524C2BD09
	for <ath12k@archiver.kernel.org>; Mon, 24 Jun 2024 18:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mygmkTp5MPiB+pUEloG695W9N7gv4xscFHAuAJeEPx0=; b=HwNS8sJUDxhA4jV7WZhpXyz8D+
	Nrirgt9Ko8U072lCSVIvZh2P+GKOYXWuMzPs2pqPsDHT+stVQGc2qnQLXcB4ue/BNdrdcr353gwpV
	eFzX62lUTAYtLawWwsPScoKdC7tx/kEQVESZutmQhXNPSoBWQo7X5xwbmjqH16bS6vX6/W2KxeFNl
	AifR69q08SxsNarZ3SZtw8GJkYYaztbFKTzyr0pHcKwpoPvBxJEKom02X0KcnoGdSpWJnvA0qOoeC
	E+LnrZPPoCi6RzNf6Mu2pPW7aE/ROl1xEsSCAKVUcHu99Vr95f1y3KlJ9LUh5x6eRNomUqp1YiE+A
	f3I59LOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLoK4-00000000Giq-43Yq
	for ath12k@archiver.kernel.org;
	Mon, 24 Jun 2024 18:21:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLoK1-00000000GiH-2ETZ
	for ath12k@lists.infradead.org;
	Mon, 24 Jun 2024 18:21:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O8YZDK018093;
	Mon, 24 Jun 2024 18:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mygmkTp5MPiB+pUEloG695W9N7gv4xscFHAuAJeEPx0=; b=izk0ofVGW3SxV//h
	xEcpZ3PqENavTva+4FeShWvUh9JWUFtcyBDqD9iSJgulP+LoXrqZ+2BSxj5+xN9q
	DF+h2sjYPpxSH2XKJrL/M/582jWnYZPgykIrbRwh5IiSPUncr3l1AIhzwiUlj3GY
	GTszkTzTi2LOOwkTwtwElTs112lDctr6W0VbSGfxxxBMIsnoDfniCjlFVOG2xGI3
	EKQ9Ct7bH1JVKk4p7Upz0Gz5Pr3e9GQ559GrsIeKtruhTGH37lVZregYLr702gFX
	T2i6JB+PrRkQ3lvk4mbK6N3Mw1lYb6lAwhgg83ADvN+DAiyem0Z/diU7b9JtQ21P
	WsHGEQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywkyn4gqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 18:21:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45OILh7A029450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 18:21:43 GMT
Received: from [10.48.244.142] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 11:21:42 -0700
Message-ID: <c72492c6-cca8-49ba-88d4-a55a6dddfdba@quicinc.com>
Date: Mon, 24 Jun 2024 11:21:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix peer metadata parsing
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240624145418.2043461-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240624145418.2043461-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5l-ze8DUxm5rH_bV3i95AuK3gGLLlD6V
X-Proofpoint-GUID: 5l-ze8DUxm5rH_bV3i95AuK3gGLLlD6V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_15,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=949 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_112145_815686_12C30924 
X-CRM114-Status: UNSURE (   7.95  )
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

On 6/24/2024 7:54 AM, Karthikeyan Periyasamy wrote:
> Currently, the Rx data path only supports parsing peer metadata of version
> zero. However, the QCN9274 platform configures the peer metadata version
> as V1B. When V1B peer metadata is parsed using the version zero logic,
> invalid data is populated, causing valid packets to be dropped. To address
> this issue, refactor the peer metadata version and add the version based
> parsing to populate the data from peer metadata correctly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 287033810990 ("wifi: ath12k: add support for peer meta data version")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


