Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E258C3DA4B
	for <ath12k@archiver.kernel.org>; Wed, 17 Jul 2024 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQuC8wNnJRvzmHAjakKh2cb5ARzuKdfj7f2ORel+PHc=; b=P+Oi1Hegqguvd1SOTySTG/sMi1
	VYj2pq4G1XXE9s7abCp+v2+ciBCe4RVxoiddgPY4FmREqbqHbbRZG7ZsYtx7t0duMatdUp9aKaN6b
	GnAVHbLDEivM4tXEsLPs/R86Us5TWhTmWufB2PF0jhTAlOwgBGmiwtxxGG0s3OtI4RGSVIP0FlOXt
	SsHQR1YKbCeMq+wWvtv9i9NrEC1/o+O+r4WHDF5vBE0mCNzMDC6LrwIqiVc3fgAc7zE6OlGrhSpEA
	duJHa9ms66f8iD0iIq3IJbXglOo78a5s5+nuiEVU/rJba+7e/xA+kUTXA8I6iZ8B5h26Vow32HPTD
	0t/wV1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU6M0-0000000EA3t-1Dkz
	for ath12k@archiver.kernel.org;
	Wed, 17 Jul 2024 15:14:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU6Le-0000000EA15-2LId;
	Wed, 17 Jul 2024 15:13:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H7U2D1013666;
	Wed, 17 Jul 2024 15:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQuC8wNnJRvzmHAjakKh2cb5ARzuKdfj7f2ORel+PHc=; b=enNi8h2Q+6PLG9xc
	+zSMLAErQfjU3Tksp6s6AR7uyOPAYjL+xNtM95uWVt8jH6G7ZdKTEfTTLKuJmt2U
	G/YTPSQswFqed+33pUnpOuK/tJUXz5/6om4GAEgvIJe9hKtACBJ3grlAZyx+Z/cp
	h+4mGs0T1Wy43by73OQKwiIWa6IdP0RL7VCpKl62eNFbWeeHMa8Mnn2n7ariags1
	qNFGcTi45uLJer7SDsg6vXnGXNh7zrvlQGp3EEXPu2VlbUG0g+DwcV9katRAVGbh
	43FeE8rxsKZHHPxkL8y8Wmco/OE8kEhXybkTVVH5yg2WXHQOgq8BXqBBmKa5Zd6P
	2/Kb0g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfwap2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 15:13:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HFDTHF021036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 15:13:29 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 08:13:28 -0700
Message-ID: <5dc0f70d-801f-4a82-8488-c200f790bad3@quicinc.com>
Date: Wed, 17 Jul 2024 08:13:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Kconfig: reduce the amount of power sequencing noise
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kalle Valo
	<kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Helgaas
	<bhelgaas@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <linux-pci@vger.kernel.org>,
        Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Torvalds
	<torvalds@linux-foundation.org>
References: <20240717142803.53248-1-brgl@bgdev.pl>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240717142803.53248-1-brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UlnqAdv4AblUlfPWyqJFSA40g_RYKitL
X-Proofpoint-ORIG-GUID: UlnqAdv4AblUlfPWyqJFSA40g_RYKitL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_11,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=418 impostorscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407170117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_081342_737266_464F2AAC 
X-CRM114-Status: GOOD (  12.51  )
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

On 7/17/2024 7:28 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Kconfig will ask the user twice about power sequencing: once for the QCom
> WCN power sequencing driver and then again for the PCI power control
> driver using it.
> 
> Let's automate the selection of PCI_PWRCTL by introducing a new hidden
> symbol: HAVE_PWRCTL which should be selected by all platforms that have
> the need to include PCI power control code (right now: only ARCH_QCOM).
> 
> The pwrseq-based PCI pwrctl driver itself will then be selected by the
> drivers binding to devices that may require external handling of the
> power-up sequence (currently: ath11k and ath12k) based on the value
> of HAVE_PWRCTL.
> 
> Make all PCI pwrctl Kconfig symbols hidden so that no questions are
> asked during configuration.
> 
> Fixes: 4565d2652a37 ("PCI/pwrctl: Add PCI power control core code")
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/lkml/CAHk-=wjWc5dzcj2O1tEgNHY1rnQW63JwtuZi_vAZPqy6wqpoUQ@mail.gmail.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com> # drivers/net/wireless/ath


