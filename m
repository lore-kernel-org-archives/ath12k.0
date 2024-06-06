Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE4BC27C55
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgHHZLFc42AkrFsoO0x+siraOmLlalkQoI+WyMiSkbk=; b=12A+MEBfrMEJpb4k10Ul7qu013
	XeR9FOYFuQnQb5NTWgB6NwA+Bk+UziimYfw4IyTujERq7xL7pTGXJswwzHbiOVs6uv3qfAu+L+p1Y
	36/LnSNhn7Cf/7NKgPn2b3YbuMTb8H7LcD9toy9HlClplxvzMyMspHXW/IwTXij68KWr9T7fhHGvV
	8GWPEWzrviGJ8+I84tWR8aKhlyZEcfzzNOo66wHwYlmOz1tcyWDLzbPtelsqDbbznQd+3/rz7tNX2
	tsBz9+nKS4wfdYhTSmZS/VAdPshjDKquJbWcoLlnWOOer437a5ab31erabOUjGXnAlLkYM3oF/ONo
	GibJSHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHiO-0000000AuDy-3byR
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 18:19:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHiL-0000000AuDE-3MSo;
	Thu, 06 Jun 2024 18:19:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456GHpB3013966;
	Thu, 6 Jun 2024 18:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgHHZLFc42AkrFsoO0x+siraOmLlalkQoI+WyMiSkbk=; b=pjaFbB1HSFFdGluU
	LroCspppBFTMZvnU9gjOxlmSoCkcOMha6/eXcgY9awr077xH6kYRioXUiGW7qYsT
	lJoEA/DNv8NDgox+oLBYUjdLbzFucxNUlwXlOwtpGykqRN5wXocL7Sb/U4I7NXcO
	CLw/fP+dpykYgGIvDEBQIc1XxsSVtS0JOxRnaI7fnGZvoWXwBKCDdxADt84S1IMX
	wQ9FdVJ26bQzo42rJ04iKSK2BT71zWXfaaJklVduAapv3NawGZWrRrciCNLAg4ou
	y0kHzWUCq5kZUFSAAIKMRBdg6Dx6qTRRY7jHeDTrQLpqIMenY6p8ojIKPQOJKLOb
	AEOaPg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjvxyax98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 18:19:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456IJjUv023792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 18:19:45 GMT
Received: from [10.48.241.109] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 11:19:44 -0700
Message-ID: <08b18db2-63f2-4eb9-ad7a-318cd7a207ee@quicinc.com>
Date: Thu, 6 Jun 2024 11:19:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] dt-bindings: describe the ath1X modules on QCom
 BT/WLAN chipsets
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <ath12k@lists.infradead.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240605122106.23818-1-brgl@bgdev.pl> <878qziqjn5.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <878qziqjn5.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FEhgh-xv4AfcdpCcpXYjCI7RdTDSgPn2
X-Proofpoint-GUID: FEhgh-xv4AfcdpCcpXYjCI7RdTDSgPn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=703 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_111953_967059_CDC44A74 
X-CRM114-Status: UNSURE (   9.19  )
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

On 6/6/2024 6:35 AM, Kalle Valo wrote:
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
> 
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> Here are the two dt-binding patches from the power-sequencing series
>> targeting the wireless subsystem. To keep the cover-letter short, I
>> won't repeat all the details, they can be found in the cover-letter for
>> v8. Please consider picking them up into your tree, they were reviewed
>> by Krzysztof earlier.
> 
> Is it ok for everyone that I'll take these to our ath.git tree?
> 

Kalle, if you take through your tree can you:
s/quic_jjohnson@quicinc.com/jjohnson@kernel.org/


