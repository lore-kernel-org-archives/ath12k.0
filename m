Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B590C3DA59
	for <ath12k@archiver.kernel.org>; Tue, 16 Jul 2024 01:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXIDYE0of5tGAtHdTG05aHneMx/Z9aqNnOmIrL+8ehA=; b=sz1LesHc8tOJaKIIBeTRqcDUSv
	6bY+/oHsElhXZdzkHmePPxzp31qxY/qm1jOYXlIxTVR7V+51WvRSEkQyfFrPMmEPa0fWSFEQ2Iip0
	vq43rSpX5uBmqsXBFJoGHE1QpFT0zCt4eB0GmejPCYZnjkEHcF6+9RuS1wavS+I9KS3Gim0rHnwKR
	t/Woc1USh8+lTPeMIuz9keZont4Z80Dcp5uVcwlSuxeFFwHX2hrFaVlF93bBbNAVSqltpALO8ootu
	AFZqjDfV9l+69VZ+089N790qvoxF1hr7KwtXC9XXi2zVm3OndHcLuS+08C5p3aEq261syQ2WPpYnc
	PlfDQs3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTXL4-00000008ztH-2zCZ
	for ath12k@archiver.kernel.org;
	Tue, 16 Jul 2024 01:50:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTXKm-00000008zpY-3k3b
	for ath12k@lists.infradead.org;
	Tue, 16 Jul 2024 01:50:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FH8klh014100;
	Tue, 16 Jul 2024 01:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXIDYE0of5tGAtHdTG05aHneMx/Z9aqNnOmIrL+8ehA=; b=UMvhwIuqVjOhXzfV
	6pcx02fQNwGTqgasH2cb0klx9Kpn6lmdgaqprQM/fAc/fuX1t2Lqy4qFA8NlVt5k
	cu7c8bBfjOkTSGXjeDWWR1Y1hhQKsp6YJO1mXPBJagNgxUT9+EnMjmX8L6Orv1Fs
	XywmMEW2+fjn1qEzLpEUPZFojRopUnNObxTr31+uWtjD+fGOp/C124ILCVnuu5os
	WOxmuhPtzw/qf5pzn6OzWugi4XK5sq4+AMIac34mLeYbfjof/4IMvQ7b8qw+IrbI
	L5ddsyK5EVCRG6z7HuGeHqscZJJ4MxT6LSYy+jQdzisOV4P/QVX7miGrJaFJZXUo
	8I+pXQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bhnuns9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 01:50:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46G1oJ99021767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 01:50:19 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Jul
 2024 18:50:18 -0700
Message-ID: <f2fe83b8-d973-401e-942c-11bd9e29e888@quicinc.com>
Date: Tue, 16 Jul 2024 09:50:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix invalid AMPDU factor calculation in
 ath12k_peer_assoc_h_he()
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240710021819.87216-1-quic_bqiang@quicinc.com>
 <47d0d6f2-ca36-4e56-8019-ace2304d40bf@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <47d0d6f2-ca36-4e56-8019-ace2304d40bf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d3MRVTCkcvUBVV0ZK_wOPs3lz-b1A8DQ
X-Proofpoint-GUID: d3MRVTCkcvUBVV0ZK_wOPs3lz-b1A8DQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407160013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_185029_189420_0E058D56 
X-CRM114-Status: UNSURE (   9.46  )
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



On 7/16/2024 1:31 AM, Jeff Johnson wrote:
> On 7/9/2024 7:18 PM, Baochen Qiang wrote:
>> Currently ampdu_factor is wrongly calculated in
>> ath12k_peer_assoc_h_he(), fix it.
> 
> You have 70+ columns for commit text, use them
Thank you Jeff for pointing this, do I need to respin for it?

> 
> What are the user-visible ramifications of this error? Just curious if this
> needs to go into 6.11 via ath-current or can wait for 6.12.
not sure of userspace ramifications. I think we can wait for 6.12.

> 
> /jeff

