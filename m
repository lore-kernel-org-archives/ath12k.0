Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3A3C2BD09
	for <ath12k@archiver.kernel.org>; Thu, 27 Jun 2024 05:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiexKIMtxNy35j3J8vlElUfx9lK8Exd3dCXp+7HQrMs=; b=144nKlJJPDh2gDwZ6QbP10wpDG
	VsBS6lJ1l+on3Qh7LvTNPgYUtX7sAnE89PSkQomCp89xArvUUSl60J0Yg3cas+hdNefCKydNmdFSw
	wFRGjguK/R5WsSUhxiPC0DNAN33I4PYQ/W+lTV5Fjhc286XnL6quKb4gSXJ1kx6X1NCYgr5sqK7o1
	zvpDdvh3+KVs9YbX3iGqc77cQe9MqH2oZL0ax+4qKj2HKUlTCOIkIKtvjpPuDQWkgkGLVyiG3AzgB
	YmsOKMVE2fst84c2S1WDSJKUajE9gtZ+CXqxX4v6ty/umN80XHplrHtkshhGf0dbqEmyiKMLiHR5q
	ds7MtNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMhFn-00000009Drl-1myQ
	for ath12k@archiver.kernel.org;
	Thu, 27 Jun 2024 05:01:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMhFi-00000009DpV-22aZ
	for ath12k@lists.infradead.org;
	Thu, 27 Jun 2024 05:01:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R0ORJd010670;
	Thu, 27 Jun 2024 05:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiexKIMtxNy35j3J8vlElUfx9lK8Exd3dCXp+7HQrMs=; b=Ua8H0tz4BlRE4zqI
	xRzxs4p2mo+prR2BdmHPlKgZVEvpQJYk0Z6lIjP5M7h2V/MrCoxBzCHcFCtvoZEE
	0nLt4XYhMgru1I4IXTXMGOA0x8Y/2zrID4wB9QnB5ZeIwEOuFIg+2RWYgRtazyXL
	sc2rdAKZrPNS/UkT7mON93bErajm6hfmlSYQsCUPAzOmpyIL6Nh7vObfx8Ysr3Qs
	w2DMrRtc/SaTk4GJh50lHn7IdslQCyKYWeGcJgz6Gg9cotecbBJVVcNRTbxTJKap
	tU6YmyuCshhLjgGi4dYM8dfUzYxCsIe6MIEEZZwL8MZI4ZBTI6js5BTe9sCrDkD7
	rN8Q0Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400bdqb3b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 05:00:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45R50pEu018391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 05:00:51 GMT
Received: from [10.216.1.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 22:00:49 -0700
Message-ID: <35189ec5-07d0-4ddf-811d-8f2018cca390@quicinc.com>
Date: Thu, 27 Jun 2024 10:30:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Allow driver initialization for WoW
 unsupported devices
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20240626024257.709460-1-quic_ramess@quicinc.com>
 <87r0cjh7kr.fsf@kernel.org>
Content-Language: en-US
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <87r0cjh7kr.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NzQMayLN22wkQascu58oSbaahp139d1b
X-Proofpoint-GUID: NzQMayLN22wkQascu58oSbaahp139d1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_01,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=890
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_220059_019202_110B130A 
X-CRM114-Status: GOOD (  12.28  )
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



On 6/27/2024 12:09 AM, Kalle Valo wrote:
> Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:
> 
>> Currently during driver initialization, mac registration is allowed
>> only for devices that advertise WMI_TLV_SERVICE_WOW, but QCN9274
>> doesn't support WoW and hence mac registration is aborted and driver
>> is de-initialized.
> 
> I changed the title and this paragraph to describe more that we are
> fixing a regression here.
> 
>> Allow mac registration to proceed without WoW Support for devices
>> that don't advertise WMI_TLV_SERVICE_WOW.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> 
> Luckily commit 4a3c212eee0e is only in ath-next, and not in any other
> tree yet, so no need to cc stable. We need to cc stable when the bug is
> in any of the official releases (v6.10 etc). So I dropped it.
> 
> Please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=dbe2f0503e5fa9394e6b4e4f442adae89cec4cc7
> 

Looks fine for me, thanks!

