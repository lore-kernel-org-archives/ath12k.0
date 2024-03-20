Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E92C54E67
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 21:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evfjbZ6Ja7i4Vo2dAlYXxLJliFVUtPE+p2PWhFnKGyA=; b=BPR0d7k8nhKhhbytF86a8IiYzq
	yw7Xk8cc0zPhp0DyvZL1sXRtEzGxC1Th46iA5YbS5yme9T702rclfAzrPab2xHB8Dj6nZPZ4I6Ci3
	ssqGzYiOyQ0bxFL5ACrGSjxI9+8bdf9vNUU7UQkZbnse6S+bJQuuzjMimNb6ywlsYd2LbNo++Dyjj
	D+57lP+5Huwra4biUCZ70ohfShLBIjUOMatr6aqh3UWyA8aHnk6A8DShfGzECgF6rBI3q+fGLJEe7
	7ZldW9Y2sbnhR6UAwQx9H31s9F4ReHIwqLzG3aO/qP9oPJtMiiZOlWPXZQjHm25r8WAZMphFIkSEC
	4YlLyPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn3ri-000000013uK-3BdV
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 21:52:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn3rf-000000013sk-3aDJ
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 21:52:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KLhtpu021795;
	Wed, 20 Mar 2024 21:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=evfjbZ6Ja7i4Vo2dAlYXxLJliFVUtPE+p2PWhFnKGyA=; b=ds
	exuQDyiYykBY8XcDZQH+Sxzs9mopqtThq7dkI5V9MjzFScYIegZK8SJNa0tTBTnk
	updd1SM7gOiw9aDuqu5tyPQtZHTYHp2VZHCMezipNiiPyAuU33lN7T94xIG+XbPU
	aHMzoUiS8lR1e7qoS+X5BVthKDPpx7mlNIWgWRtFoUxHwRhFIq+PpNZVLA79+Fvn
	RgRYkOjBl2jg9xUScK6mHE7JwvU+cwkGc41wZ1IwruXGOGkmup51xfwHKDuH03BV
	mrYgezehnTNIQ6jt6LXn7KB/rdtJepZV7NkpBlTyVZjIynOZNpNb3sYDos6vvZtX
	Dw8byNppKaH7mmtV9Tng==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wyxq91dtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 21:52:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42KLqkjp006903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 21:52:46 GMT
Received: from [10.110.120.226] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Mar
 2024 14:52:46 -0700
Message-ID: <71371ddf-aa0d-4343-82d3-c10d560d7526@quicinc.com>
Date: Wed, 20 Mar 2024 14:52:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] wifi: ath12k: vdev statemachine changes for
 single wiphy
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240320190943.3850106-1-quic_ramess@quicinc.com>
 <20240320190943.3850106-5-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240320190943.3850106-5-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: e6MXyBaJ7EkcTGtreQzolX9nQzUhFOvb
X-Proofpoint-GUID: e6MXyBaJ7EkcTGtreQzolX9nQzUhFOvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_12,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=834
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_145252_065993_80A67F63 
X-CRM114-Status: UNSURE (   9.07  )
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

On 3/20/2024 12:09 PM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> With single wiphy, multiple radios are combined into a single wiphy.
> Since any channel can be assigned to a vif being brought up,
> the vdev cannot be created during add_interface(). Hence defer the
> vdev creation till channel assignment.
> 
> If only one radio is part of the wiphy, then the existing logic
> is maintained, i.e vdevs are created during add interface and
> started during channel assignment. This ensures no functional changes
> to single pdev devices which has only one radio in the SoC.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


