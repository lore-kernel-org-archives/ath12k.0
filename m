Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45098C35FF2
	for <ath12k@archiver.kernel.org>; Tue, 11 Mar 2025 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2L/cjP+xW3ezqn+dhCx1N3mGJFQq5iYjKgqQzdfP6E=; b=2WQ7EwxExob6o9msK5xRVFjtQN
	/RF4vn9YHc3O81CF+KLmOKDkUInjICk+DDMxHTQc6NnpwPsvdc7N7nV+U/EtdMWx7d+/6gjUZi5sB
	tBTQGy2Nw0ARpBjBT56FLxaJuJRT/YrAjuXQ15LCo9z9KXy3ZwwGre1i9F3dj86X/rQRqxcChXWaq
	pdomK9BV3mb3xcH17QC+eadpx8r0/7hzv65y4Zx4cteEeWBXrVK6r/ge/vf3gsY1gv9IlberHbHZk
	sgUslOTiBFsNGSLHqfjsDLedA+/3BBPzFqB7v0/mZrVNnhzJWgqmRRuyuiwzNWplIwAKPlQRuHfPa
	HQ/pzwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1wV-00000006DWu-3lIM
	for ath12k@archiver.kernel.org;
	Tue, 11 Mar 2025 15:54:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1wS-00000006DTm-3mTM
	for ath12k@lists.infradead.org;
	Tue, 11 Mar 2025 15:54:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7oiM6027925;
	Tue, 11 Mar 2025 15:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y2L/cjP+xW3ezqn+dhCx1N3mGJFQq5iYjKgqQzdfP6E=; b=R4nsn2waJJVonBoW
	9zUH/MLuoaqck97WfuyuRlj2qyW2twjzHmh2hRRjjwo3mtrgUaUWJRGBrhn3tYX4
	uIKJMq+Xui6HmRIEoza5AdMlD4cH6uwR9FtWMiSrM6IJTCwnryvZqdRsUhbshCt7
	49USFFOi6ewsXmTfyXGa3u85KudWg7ETsbGTB29b8uIkYCgQ7KnYYqGLnHbd0uuR
	py2pJLHmOsp1TbbIXWqFHZbF1htG/YJnzocWSPz+3CcbZDzqANyy57rm0bGHoiP8
	07WX7CxUm9CyBrDP6g20EFIbv7KlLpOGh8zdbo7CqjsLrgL0MPrWqkYsD2cpx2us
	ZyG/Cw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah529gqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 15:54:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52BFsoaG003754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 15:54:50 GMT
Received: from [10.50.36.65] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 08:54:48 -0700
Message-ID: <7938b66f-974e-4ff1-97e1-7904ca802a7d@quicinc.com>
Date: Tue, 11 Mar 2025 21:24:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v4 3/4] wifi: mac80211: Add helpers to fetch
 EMLSR delay and timeout values
To: Johannes Berg <johannes@sipsolutions.net>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <20250306062157.1185769-1-quic_ramess@quicinc.com>
 <20250306062157.1185769-4-quic_ramess@quicinc.com>
 <9a2d609041f3797c48080ca8a2a63b56be94c358.camel@sipsolutions.net>
Content-Language: en-US
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <9a2d609041f3797c48080ca8a2a63b56be94c358.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XMHZGISvfNBse3i83JXmPlekz8lHZuLZ
X-Proofpoint-ORIG-GUID: XMHZGISvfNBse3i83JXmPlekz8lHZuLZ
X-Authority-Analysis: v=2.4 cv=DfTtqutW c=1 sm=1 tr=0 ts=67d05ccb cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=0xUlOXijzjPc6a2fhUIA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503110101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_085453_059520_6E039A68 
X-CRM114-Status: UNSURE (   9.29  )
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



On 3/11/2025 3:16 PM, Johannes Berg wrote:
> On Thu, 2025-03-06 at 11:51 +0530, Rameshkumar Sundaram wrote:
>> Add helpers to get EMLSR transition delay, padding delay and transition
>> timeout values from EML capabilities field of Multi-link Element.
>>
>> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
>> ---
>>   include/linux/ieee80211.h | 74 +++++++++++++++++++++++++++++++++++++++
>>
> That's not really mac80211, but not sure what we usually do here.
> 
> johannes
> 

I checked the last change went in ieee80211.h and that had mac80211 so 
thought of putting it, but digging deeper, seems its wifi: ieee80211: 
(https://lore.kernel.org/all/20240318184907.00bb0b20ed60.I8c41dd6fc14c4b187ab901dea15ade73c79fb98c@changeid/)
Thanks for pointing out, will update it in next version.


-- 
Ramesh


