Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E528DC2BA1A
	for <ath12k@archiver.kernel.org>; Tue, 18 Jun 2024 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiRK/V9uXo4IwdHQ1b4a/xc9UcBByoDKp524xt/+JUg=; b=IcbMEsj9d7xfJhy37lmhSynwNg
	Ftd3zWJuwyYQSafZt+K8nPpb8/HvmNWQMR+8DITUNR1Ls4X4HfvK4O323+b/z5p+HuniF8aESW/aQ
	H6PmsUhxnTZZjv314mS7+LIIkAAymSb6smXU4iVqYPi+I9cyC1lna8EBQaqo0uCSc946BXEFVCFv/
	zPN3q77qDtN04Yw0UjKokCvaixU0TV7ngqMzScQ+p/QM/upuqdpzitRaEzXejQyxzDlOYCDBd8buh
	vq0UV1av09rcO+7e1YAbLpLFq/+jYVztXSXQAMF1TDce0dj4fYu6eZYugiq9qlevaeeOegDbuw9Dw
	XMKV9Z+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVv9-0000000EJEX-22ci
	for ath12k@archiver.kernel.org;
	Tue, 18 Jun 2024 10:18:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVus-0000000EJ3A-3JBG
	for ath12k@lists.infradead.org;
	Tue, 18 Jun 2024 10:18:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I8MQje023008;
	Tue, 18 Jun 2024 10:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SiRK/V9uXo4IwdHQ1b4a/xc9UcBByoDKp524xt/+JUg=; b=bJ53wUidfZA8dpmn
	2KZ/cT+UgrggNNVxAHWPssvbJbpD7BtQmC/16yzGQL0NJzLJVNZsi//WjGMsVfGN
	iD2dU5FseKKOdqv8tIAVmW0wBcK6Tt/oFbfphfXu55a0Vmm1aYxanftL1pDQjNJq
	sAb2pkld3bvK3nwrFBYxITvYH62+IOBavLvuRo3YuRsPd2g5uN0WHUMOe1dAT13w
	VxRqp/GeTL1Rwei1C8o3POPkvZ3hZDmB2fVFm76cpzO1FrPsI3dBT5jC3zaK2Sj7
	waxAWFdDIkwZWLNVzyy0mGIm57Z7spZPVPP4yj53lw9syO1ANq82Fn46r7VF9+/k
	VO1ihg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yttyr9nx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 10:18:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IAI7Wu013138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 10:18:07 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 03:18:05 -0700
Message-ID: <73182626-9638-49c7-a536-332415310595@quicinc.com>
Date: Tue, 18 Jun 2024 18:18:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] wifi: ath12k: prepare vif data structure for MLO
 handling
To: Kalle Valo <kvalo@kernel.org>
CC: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Sriram R
	<quic_srirrama@quicinc.com>
References: <20240617131650.3288118-1-quic_ramess@quicinc.com>
 <20240617131650.3288118-2-quic_ramess@quicinc.com>
 <3754f5f3-0e67-4c5e-9b56-888ad5071622@quicinc.com>
 <87ed8umysh.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87ed8umysh.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: endHykqvqBmoSwqaOMMUca0bmdw7wgbG
X-Proofpoint-GUID: endHykqvqBmoSwqaOMMUca0bmdw7wgbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 mlxlogscore=411 impostorscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_031819_365248_4031A1C3 
X-CRM114-Status: UNSURE (   8.09  )
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



On 6/18/2024 4:37 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>>> +static inline struct ieee80211_vif *ath12k_vif_to_vif(struct ath12k_vif *ahvif)
>>
>> better naming as ath12k_ahvif_to_vif()?
> 
> Thanks a lot for the review, I appreciate it. But please edit your
> quotes, having thousands of lines of quotes makes use of patchwork
> practically impossible:
Didn't notice that, will do.

> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20240617131650.3288118-2-quic_ramess@quicinc.com/
> 

