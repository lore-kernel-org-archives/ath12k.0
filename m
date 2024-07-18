Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C553CC3DA49
	for <ath12k@archiver.kernel.org>; Thu, 18 Jul 2024 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNT71tPy05ChRz7sis8j+D9KLmuFbuIxE/qs7WYt1fU=; b=RGZQwvzpdlP07+fgxWqbJvZrmm
	KprBFN8Pm62/+ITABE5g0G35vxNUTFlGtZ7w49mumuaYZB7Qklr+b+kuuj6iYAXackGdMYeXgE5Vx
	UauSZnpUUMKN9+W7W22m3TrDJSG+vVEqNd0gYdu2mcJ14BHxIN6O28KopZBmLn4vwz5q8cLnc6U4L
	w7oepaH9kOdl4lEKEqe4KCuYFPPjyYq54Y2rknGjj0PQ7KT5QkFcfHzryno5tYSyNf7C0jtgfAGeE
	tJBZ3fl8iNFrKNBLaF4Ej7jiEEmyvR7Nr1iKPgc6wAlWkT3pQogIL8xLQF1QLCgGvkA7JfGTMNagj
	bB84iz5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUSJ5-0000000HIIG-22St
	for ath12k@archiver.kernel.org;
	Thu, 18 Jul 2024 14:40:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUSJ1-0000000HIHn-2zIm
	for ath12k@lists.infradead.org;
	Thu, 18 Jul 2024 14:40:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I89Hgm029089;
	Thu, 18 Jul 2024 14:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNT71tPy05ChRz7sis8j+D9KLmuFbuIxE/qs7WYt1fU=; b=ZrXMuw0uLCNZ88mw
	/LdvEFHXGvzh6gHQC3WRx+5f7BoPSa0Lmh75o/4Kmf8jdsyNAY9ZvLay/KJgYJRQ
	u4wTxNWqoYZvGMCNTjjdn3BgDC6cRZTvCNDOKTOd7r8IsGcprJPu3q12gKqmUZnp
	TagXGuNmw1VvXfE2L5VE9h8BX6F1blpudIo9UJepRelPhbCFbH6HhMckHXASeokg
	Kyk+obcfWcUXJSIp+9kSu8hyXty4UrenZjAEvRXwsXS8o9NomtuFy69c+s79grFG
	JcfHMZrYRC1jwYMYI/WFeXMJp2VF+ozi+aD9Ha4mSMz7zO6Qy/prMG+Jt7s6Ugb/
	2h32aQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfs5sdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 14:40:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46IEeJIm029753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 14:40:19 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 07:40:18 -0700
Message-ID: <d44fdc0b-b4a7-4f36-9961-c5c042ed43df@quicinc.com>
Date: Thu, 18 Jul 2024 07:40:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100-yoga: add wifi calibration
 variant
Content-Language: en-US
To: Patrick Wildt <patrick@blueri.se>, Kalle Valo <kvalo@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Steev Klimaszewski <steev@kali.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <ZpV6o8JUJWg9lZFE@windev.fritz.box>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <ZpV6o8JUJWg9lZFE@windev.fritz.box>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B5AeWhvGDVXLAGUShuXalfOdCrnjVIRi
X-Proofpoint-GUID: B5AeWhvGDVXLAGUShuXalfOdCrnjVIRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_10,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=731
 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_074027_879810_B0A0F035 
X-CRM114-Status: GOOD (  12.00  )
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

On 7/15/2024 12:38 PM, Patrick Wildt wrote:
> This series adds the missing calibration variant devicetree property
> which is needed to load the calibration data and use the ath12k wifi
> on the Lenovo Yoga Slim 7x.
> 
> Patrick Wildt (2):
>   dt-bindings: net: wireless: add ath12k pcie bindings
>   arm64: dts: qcom: x1e80100-yoga: add wifi calibration variant
> 
>  .../net/wireless/qcom,ath12k-pci.yaml         | 59 +++++++++++++++++++
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  9 +++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 10 ++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-pci.yaml
> 

+ath12k mailing list.

Qualcomm expects, on x86 and Qualcomm-based ARM devices, that this information
come from ACPI.

That support is currently under review:
https://lore.kernel.org/all/20240717111023.78798-1-quic_lingbok@quicinc.com/

/jeff

