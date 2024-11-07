Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8929BD5D674
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 17:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0rdTfLxHXh4Azbw6tlMVAkBP0BJZluXJ5wiWe+4++Y=; b=UwMDybv2106OPzEr0X8pykC9Kb
	irVybQc2PwT/PeVF4qu6cw5SoO0wNwB7gO+pnVrZIdINK03nBQG29P3j2o4yEkIHWGsJapumeHyQ8
	2PjNGILo0dUo1B77XlulxCWVAqFz7kE4IH/D2mbjgzZ3b22ZS7y/ACrf6GnxIc2ZgV9SCn7xoZoSc
	5mWAs7bzLUhbHmufju9g0bxtsD+IX2G28PXU58mDPxKqLwdqpteDPbCkXsrI9TaMOioM8M+UOxXgC
	3FHSKyLTr8B6MTNAov2o9r3mq9Opg/pwdk9g57K8mS9mzo0euSrZD8owO1lERM2zSlEJa5ozi11ER
	5qQZugpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96Rg-00000007pp2-14S5
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 17:37:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t96R1-00000007pen-070y
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 17:36:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7HLZCj020647;
	Thu, 7 Nov 2024 17:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0rdTfLxHXh4Azbw6tlMVAkBP0BJZluXJ5wiWe+4++Y=; b=hn7N4yitYZQ51PbR
	N0x+y+WALX/gKwJNKopGFc9IyrugOQQRj82//r3WfC1jk/GGo47Ui28vV7GvHgSz
	GwwmBsLqVP0tvLacXgxQFfFsz+sVDG89XOfL+a6HDHtKLPFGln/YVv1cURZgR56P
	GpHjiJ4O4o2lf5n/sO4cBxM8j5u36+JbzUQ96BW8fn0lLXyWiqOdtnwPRAA4m2vw
	GqDZSLKtM5ZsbfHAFcM3wMXMElTEPyF74jd2Zh/pKfYCGTl7Jtcw7/on7xqnW3FA
	Lf/fT3yFqvz459nBO+MTw+ecp4bFycGGr60zVRzKyFnmXUhd+wuUe16GbMFkXkiU
	p9eB1g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ry700mvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 17:36:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A7HaWud008817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 17:36:32 GMT
Received: from [10.48.242.241] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 7 Nov 2024
 09:36:31 -0800
Message-ID: <fa1c6387-e6cf-4508-850b-fc5f8ef126ce@quicinc.com>
Date: Thu, 7 Nov 2024 09:36:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k
 PCI module with WSI
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
 <20241105180444.770951-2-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241105180444.770951-2-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C9Utvv_E6VIwf5hGWeuU7Q3HFnbfRwOb
X-Proofpoint-ORIG-GUID: C9Utvv_E6VIwf5hGWeuU7Q3HFnbfRwOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=850
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_093643_212609_B52F05CB 
X-CRM114-Status: UNSURE (   6.22  )
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

On 11/5/2024 10:04 AM, Raj Kumar Bhagat wrote:
...
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
> @@ -0,0 +1,205 @@
...
> +maintainers:
> +  - Jeff Johnson <quic_jjohnson@quicinc.com>

please replace with jjohnson@kernel.org when you post v4


