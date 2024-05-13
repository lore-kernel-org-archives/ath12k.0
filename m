Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107A8C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 20:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTjuj5JDBZneHV80Tm96RWdngRKZ2JXEyDbmE+JokQk=; b=c7eka8GiOJJXktb36NO1GWP9AK
	mA2S5ykTKkqyaPTpZGF6YwrQxrFrbd90NL78yXKYrHtmTTq90KmJfQkSMWXP34xqCL5RVOrGEZ65q
	aNQGrkrTU411u2FSCuApKdUY0s2OiyNIa7XDwKyFot91eWMpFgvED+B86d+yTUsg7WYnlsK6uCsi0
	CMX6bJSyBChB6az8gzqnQfwYVzMMTgE+jk4s6V6T2KkjhfNq3/cEz9Rliwl1OhoE0cI7xQN8HqBjb
	j4/b3/zyplcb5jnLXMk1INWyT33t0M/kR2BzdFRsMUf5DpQrfZCC3bhG15zZKG9BgZnuJPB8fYqnA
	xKsqgzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ciZ-0000000EB9n-3Guk
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 20:56:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ciX-0000000EB9P-1nbu
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 20:56:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8vbo021552;
	Mon, 13 May 2024 20:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=zTjuj5JDBZneHV80Tm96RWdngRKZ2JXEyDbmE+JokQk=; b=NK
	C7EGaMQk5bFg3iUoFBu9GCtkKPiXDnjvaQ8sREU0Mbq/ptLhmVQIX2bXOi/J/TNP
	9r+j1Aeat2od+oR7HvhY4VIEZ4o9JygYc6h9MpNa4p4C5czwASVZm15HspbSJyiM
	icoIULdU+VmgENMIxSO1FB633WoB+V+jb7GzhJAw3aOxinY6R/b0dKn9Va7HpreK
	Icg5DrA06T4Q8PGN0DTbtM26++39mO3pziO47IgphJrVQBR9DYAGcN2TBe+G1juF
	XZaZsIjSyztexVld5LzrTb0mrDLP5lLcfMCO7lZ0b4OkwQJIZCinHw+zuuMKscKF
	FOJQkTkbrKlzBZHlIHrA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21y7vg1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:56:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DKuFVN021928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:56:15 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 13:56:15 -0700
Message-ID: <15047448-4fb1-4024-8d62-1922e8f15940@quicinc.com>
Date: Mon, 13 May 2024 13:56:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 10/10] wifi: ath12k: add extended NSS bandwidth support
 for 160 MHz
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
 <20240508002055.17705-11-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508002055.17705-11-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gdMFGgMUORq1dkVVBEeV1PXeb_JtvKXU
X-Proofpoint-GUID: gdMFGgMUORq1dkVVBEeV1PXeb_JtvKXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_15,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_135617_831009_62450534 
X-CRM114-Status: UNSURE (   8.06  )
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

On 5/7/2024 5:20 PM, Pradeep Kumar Chitrapu wrote:
> Currently rx and tx MCS map for 160 MHz under HE capabilities
> are not updating properly, when 160 MHz is configured with NSS
> lesser than max NSS support. Fix this by utilizing
> nss_ratio_enabled and nss_ratio_info fields sent by firmware
> in service ready event.
> 
> However, if firmware advertises EXT NSS BW support in VHT caps
> as 1(1x2) and when nss_ratio_info indicates 1:1, reset the EXT
> NSS BW Support in VHT caps to 0 which indicates 1x1. This is
> to avoid incorrectly chosing 1:2 NSS ratio when using the

s/chosing /choosing /

> default VHT caps advertised by firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


