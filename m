Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86F2D73619
	for <ath12k@archiver.kernel.org>; Tue,  3 Dec 2024 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KaoB5KjyuO+cWvVZwhloozjQT1ZeYOQtXDf2eB62T0=; b=cZ2u4Kyd5LS+etzK3Y29+K3X1y
	mgKceH+O0y4gPyf8CQ37/VyFvVuTFyeGqWFfHgnVMKvKIiWUj2HNgtsb8dY9MUhHi9pcITfogBnRf
	tbCpUkmmIbcAw6Gx6eERHKMB03gySHwYqLYdAF8usx7ofH6ZTQx7PVe+gac9UVyEefDXJM6+9WIdL
	P75l9C3aKpj84fka2vd9aKPGeCVGGlPP+ObExVVzzJb8ca3TGP7dpB+16ijw9M+Eb6l6Nb/I+0ZnG
	0iN+3OWF9Mu6cDd59PTKzdSlJqNVXBtN8X+UlWIsJbfyKLOl/IXoEyFNeK+Z8fFXAKIebpREPJ/f4
	twcXEm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOzT-00000008pje-2kNs
	for ath12k@archiver.kernel.org;
	Tue, 03 Dec 2024 09:14:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOxv-00000008pRq-0G1z
	for ath12k@lists.infradead.org;
	Tue, 03 Dec 2024 09:13:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B383AQs025674;
	Tue, 3 Dec 2024 09:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0KaoB5KjyuO+cWvVZwhloozjQT1ZeYOQtXDf2eB62T0=; b=BfWf3ptWqtx3B0+8
	6Lv8xQ5gtjOpbgGOpFtG2mR3mUIl9HsLy/dDjZ/a43A3zfiDBjfVJIBJmk1rs9An
	XojXd0wIabhRjVUVMUNMrL2IDW6AZr1on3lHhmPwUaDQBGmsgHi3+qO9zFjI6I8D
	hzMQtDwvv+kTxGWeOth8qzZoW7ZlLom6jYDJq5M4NbLovLlw5uh/mulzMj2WEBoj
	+6IGUjYbAgYTac2C/Msr9GOm95oLwSWZ+c7R3rtrzfYWPjZQEQIt0DtKgI+4wJ41
	Ba9PvExvyhiB8KedJKU129fV0Pso9ha8ZYdJ+KlZiYR4ityi+KinM1mLQaN9Frdd
	tATO4w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437uvjyd2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 09:13:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B39D4UQ028352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 09:13:04 GMT
Received: from [10.151.41.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 01:12:59 -0800
Message-ID: <d7a001aa-f203-4e2d-8d39-615066e12969@quicinc.com>
Date: Tue, 3 Dec 2024 14:42:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/22] wifi: ath12k: fix incorrect CE addresses
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
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
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-13-quic_rajkbhag@quicinc.com>
 <af289022-218f-46fc-99c2-3ccf027bc8fe@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <af289022-218f-46fc-99c2-3ccf027bc8fe@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F8grdtWab1wLU11PK20TeYLn5fXgllGg
X-Proofpoint-ORIG-GUID: F8grdtWab1wLU11PK20TeYLn5fXgllGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=949 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_011307_109297_FD02C469 
X-CRM114-Status: GOOD (  12.06  )
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

On 10/19/2024 1:32 AM, Konrad Dybcio wrote:
> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>> From: Balamurugan S <quic_bselvara@quicinc.com>
>>
>> In the current ath12k implementation, the CE addresses
>> CE_HOST_IE_ADDRESS and CE_HOST_IE_2_ADDRESS are incorrect. These
>> values were inherited from ath11k, but ath12k does not currently use
>> them.
>>
>> However, the Ath12k AHB support relies on these addresses. Therefore,
>> corrects the CE addresses for ath12k.
>>
>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
> 
> This can be picked up independently of other patches in this patchset,
> please try to position such changes at the beginning of series.
> 

Sure, will have this patch in start of the series in the next version.


