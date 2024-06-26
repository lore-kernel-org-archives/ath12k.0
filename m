Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E942C27C4F
	for <ath12k@archiver.kernel.org>; Wed, 26 Jun 2024 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZmj3uwUp2TRqIIHbXM04jENGvU+ZT6VK4YgwLGTgPA=; b=HA30ZTj8Mq85VAY/IoF1XZfbFn
	ud1G4l5mDY0B9TnjKguJ9+wFnNaqM9K3g8LJ7PpIUAbMUsY0f9PVgMw5VNR1ZIc/TKFBd1b4r4T5Z
	ISFtTN8293HOKgpfpS/WGBHIG6hogTyKhCzH9heRM4O9hJkAIteY+DCRxXr8ZuEVa9mQbXWANR3LF
	FOdIEFPb33M3tU2n/Vi8ThmDoYpGBnmH8ntNwJnX/berpon0ofFgOn4wIyK3Lo4a11S5dR8KhHXb9
	0RJRHksylM+tOKrzD/yE+s8OnYFuOQNTNHDxkkU1LiZv4EigNhLvibuxBMKUuwZSLMUWuEfmT+hzO
	oEd9LEWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMXdY-00000007x52-3jIv
	for ath12k@archiver.kernel.org;
	Wed, 26 Jun 2024 18:44:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMXdW-00000007x4X-2oNM
	for ath12k@lists.infradead.org;
	Wed, 26 Jun 2024 18:44:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfVkW023753;
	Wed, 26 Jun 2024 18:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZmj3uwUp2TRqIIHbXM04jENGvU+ZT6VK4YgwLGTgPA=; b=QULxcFs2tSZTX4uh
	DU6lPwujr6Iii3ARiVSs5nYVD9gOIJFZQZU9PeIr0FdSj5BVuMsS84l1XlXgOZib
	JJkXe5ZU1OJIEWqeXDh0OdgvO14aG/kM9Ov7kzeLkH+kBouIXXThHG1sRVMYPL2u
	zIJuXHxsOSPU5U3N1JYlgGSqh+DdqXLt1STtU/KTZLn4gmZJj+Cjm2Q1852t/cyI
	5GR7y32Bpy9P5Q5EWxtqYcWZgifYKTqVobpAWCzO0zfBwVlo6xSlMbTmO0Ucqr8t
	5GZTAPZLEOwzvux5XMJ5MFv+lyWsBx6Krrk2ZIBLLGuT/f293ASJAVNhD+2cwSw0
	nvU13w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6ytd7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 18:44:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QIimT4000798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 18:44:48 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 11:44:47 -0700
Message-ID: <78b22ff6-5847-48b7-97ab-187f0b60c422@quicinc.com>
Date: Wed, 26 Jun 2024 11:44:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Allow driver initialization for WoW
 unsupported devices
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20240626024257.709460-1-quic_ramess@quicinc.com>
 <87r0cjh7kr.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87r0cjh7kr.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7e5jq288ZtMF8wZdHZn9oWlPyeiRM4e9
X-Proofpoint-ORIG-GUID: 7e5jq288ZtMF8wZdHZn9oWlPyeiRM4e9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_11,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=928 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_114454_870338_54BCCA40 
X-CRM114-Status: GOOD (  12.45  )
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

On 6/26/2024 11:39 AM, Kalle Valo wrote:
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
LGTM, thanks!

