Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118B8C61D90
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 16:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyw0enEerfnw1bGG/sZGnGyMn0NVHhaw3zhZ9dlgshE=; b=FhBGiBqtgbAzSF
	l4uYjKYytHjB6QqRpigHKl7hYsuXovhid5qSTIKg/9pjXQwiGprYpbfRjXiwbGZxqH/E3o+xFr8JI
	iguvdb9zbU4mmUblRione9UeJ18mHF3AhG6zwT5IYHaLkROp5/W97OSXJrQJFYhlas3Pl6qh5pbab
	JiTVJRIqrA5oShqwFJRSKTSyMOJjEA1wQhfIu6tOdA5E3Teutow6TuJutc+IBNpJBikB2ThGxZVP4
	VHdSY7vAocvJfi5Amq5aR3Wsr8JdMqvbQcw3i9nfVvCe5a0bXjvnYcmP8V5NJHhzyt6LGkUiYNVzC
	1K+dew1jQW6hK0DrfBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TGh-00HEwQ-2F
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 16:06:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TGe-00HEvK-2L
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 16:06:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALE2A3I027341;
	Tue, 21 Nov 2023 16:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=73gKxGYAx6ZqonAGyIOfj3nt6aoxP5I6g8KM488fgCQ=;
 b=LaOyoYSJQFABKnZUx49lBe4YEJlW/RBMWooBeqfriQEjX7K66BmHSSg/EnmFG0Ljad4I
 Wp2wi+jX+Vgy7W1TYIe0TY41r0dhZ/Jl7L8yFNoDptaASS2ZfD42Gqh61oDe0mBg7Xbn
 61fsEDzF1a4M1JPFn1mbGNc2ST0hE84vK+OFXZxQ3bm/OmXAGXhfNSvYwWiGOQf3USne
 xRPnmB2fIk0f+QNHjJz2FnBgYVHQZhUM8j4R0PHveMJKSCPMZGOlWshcqHxJjBZsQaXW
 szsNRk0gHQjaDCutDo1WfSiUg/1sZQJfoY/wIrpJeFiqe/KycPlyZ23uZa4d1PJkh0iP QQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugk6x27kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:06:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALG6QOF027479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:06:26 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 21 Nov
 2023 08:06:26 -0800
Message-ID: <485e2c52-a12c-4325-84b2-38a64cc92708@quicinc.com>
Date: Tue, 21 Nov 2023 08:06:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] wifi: ath12k: get msi_data again after request_irq
 is called
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231121021304.12966-1-quic_kangyang@quicinc.com>
 <20231121021304.12966-2-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231121021304.12966-2-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7x-VRQwiYdLYzZhOEuHrLeyIYJWndizu
X-Proofpoint-ORIG-GUID: 7x-VRQwiYdLYzZhOEuHrLeyIYJWndizu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_09,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxlogscore=570
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_080628_875208_A43B16FD 
X-CRM114-Status: GOOD (  16.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/20/2023 6:12 PM, Kang Yang wrote:
> The reservation mode of interrupts in kernel assigns a dummy vector
> when the interrupt is allocated and assigns a real vector when the
> request_irq is called. The reservation mode helps to ease vector
> pressure when devices with a large amount of queues/interrupts are
> initialized, but only a minimal subset of those queues/interrupts
> is actually used.
> 
> So on reservation mode, the msi_data may change after request_irq is
> called, then it will lead to spurious interrupt. But when VT-d in
> BIOS is enabled and ath12k can get 32 MSI vectors, ath12k always get
> the same msi_data before and after request_irq.
> 
> So in case of one MSI vector, ath12k need read msi_data again after
> request_irq is called, and then the correct msi_data is programmed
> into WCN7850 hardware components.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
