Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4200C47258
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gkp4daE60ZX9zyMAxml18Pz44BcOOLcB+Ucfwv8XIoA=; b=k3st7uuor9RIva/TfMMptx+m4n
	6fyzNi3wW/9Jx6wconTvS5ZpiLXbG+z3P2YPJNTgwfeSmio0wswyfr1zz7RsFJess6TdXcAXLkcBI
	FpQxO5nArmqRCtrgtoO0ocacMEm0AgfA8KecoBeld4o/c8bQBSHPKPIRGRmXOqc4b/JYKV2iwdRB6
	dJSLkG2fmQ1Nr8/vSMyHqRdN2tf57LVnGPk6yOvh6gFGRebew7+LbEiGH+jksbQipj3v44NOnSAtr
	E3CEGCxp7x602WbBTNDtdsHcENDwBwadEaXB2xwajBeL85FOhDTl6kBBGl+5Ueo9Dds7VWARE3Qs0
	/LKnXJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOLIl-003TCx-1f
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 17:26:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOLIj-003TC0-0W
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 17:26:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CE6Zbc006113;
	Fri, 12 Jan 2024 17:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Gkp4daE60ZX9zyMAxml18Pz44BcOOLcB+Ucfwv8XIoA=; b=gK
	NoXMGBDpw/aKM726LbyKEjWKaVMhiwphSSO1pV2qxrUgG3ECtgk0aXSeQhngJbKm
	oZe/D7IALXOqKk0e/LpNP/Dvtfcua+ghqfOmIZ0QvLtEwQr6p2RqcitNRgqxwMAy
	7dKsMXik5xYWDWwMyH9oxn/HgYlJq5e96Fn95WnznLD7DqR2lfnLeKuTUSJPky8d
	vbDyvYg8kSvAG+fFNnUkNGHVuuykMNAD9ANuinh5cWJwPhIBp1Qg2P3Szc8LBQ/a
	W0/fu8SPFudX9k5iboWmlh7hiZCseZfSf4wchx4C5Q4EZts6rOw514n6VMsa2I/u
	PAgXfdsICj5HbGIlBtcQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjqx1jh43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:26:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CHQZmH007256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:26:35 GMT
Received: from [10.110.16.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 09:26:35 -0800
Message-ID: <62b83607-250d-4321-8ae5-2f6cb13fea54@quicinc.com>
Date: Fri, 12 Jan 2024 09:26:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] wifi: ath12k: Add additional checks for vif and sta
 iterators
Content-Language: en-US
To: Sriram R <quic_srirrama@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
 <20240111045045.28377-9-quic_srirrama@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240111045045.28377-9-quic_srirrama@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I63Cr3Ih9NjToJI-cfOUgCcqVyV4YBFH
X-Proofpoint-GUID: I63Cr3Ih9NjToJI-cfOUgCcqVyV4YBFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 mlxlogscore=517
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_092637_203721_A9F45DB0 
X-CRM114-Status: UNSURE (   8.20  )
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
> Since vif and sta objects of different radios are added to same
> local hw list in mac80211, additional checks need to be done
> in driver to ensure we are processing the intended vif
> and sta corresponding to the radio when the vif and sta mac80211
> iterator utils are used from driver.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


