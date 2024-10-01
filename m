Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5A3CF318A
	for <ath12k@archiver.kernel.org>; Wed,  2 Oct 2024 01:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hBtFRQ/pODJPlMZDaeE7XDB0qJUQKZqYSGjobKZhKU=; b=45/D2WWjYPajfmglgAHKG0M7k7
	Z9n6Z31fsGlEUq6mFoDTboaR5HsHXgP2JQdBBqMx4A3umC6ItIR64kecsQCz4LZyaGWZtCcL3QkLE
	94XsjRW6yrs6RAi8kXgh1mEOLii6/Y7T1+O4RtJhwgILElDfHa3jqE+3ZVkXBjFgbfzDfB0EikHlW
	f/Sv/IU90LmC15/AAo38mBKGGgEZRXYAkLRChF1qvX7BrI9rbdvD1tUvYogB5GPYL7XCLCLEeyLeF
	8V9BJltQ5B9ZYFwj2QjaD5d4EOgDo6gC9IgClfp2vfHkuYQOsbG8dVBHnryGy4GyQfHvfG4Dv+sWM
	seLgp1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svnkP-00000004Ule-0g2a
	for ath12k@archiver.kernel.org;
	Wed, 02 Oct 2024 01:01:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svmQ4-00000004Nen-2QIH
	for ath12k@bombadil.infradead.org;
	Tue, 01 Oct 2024 23:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7hBtFRQ/pODJPlMZDaeE7XDB0qJUQKZqYSGjobKZhKU=; b=opMUXpPEokMzVpdVYl8rmsRK1i
	yt+GE9GKNXT21wke5J2KbgAihyYyDfm6fsFwDdiEuQFRLfnNdnQZzGhY2g/hW5Nv0J6zj9LxJ4fRQ
	eEef2UG6iRqkmZcNTIVlly2CLw6lNT3QrPiETcDrPlvsvmntyPL/4G2EI/9DTYyFMOskI0eNgYq1h
	sfsE1ZGNK/+9vbz9YOVmn9DZCQCKUTeZP49j/PRn7SlXlHW2htmNmFaxSVatvy2TUTZRa/Yjyw8XY
	U1penm0wmTsGmeG0Z86CM4XKSy8VAA7WW2eNvaIPm7z7yIrkr8uNJdzo7CO+3aBRRCoSGuNxK4e97
	25IwR+Sw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svmQ0-00000003MCK-3YQq
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 23:36:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491N7ZBT013853;
	Tue, 1 Oct 2024 23:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hBtFRQ/pODJPlMZDaeE7XDB0qJUQKZqYSGjobKZhKU=; b=Ei2CyyJARHDXWJI6
	CrxSHN1mZNBgz/uAT5rZM8EFWrQ+3IVVaHnGaaugFJHLutG3gq7uz8QvhWZxIxav
	ZINP5kb/EQWXzVF6NJYKUB4Y8LfXRmnQqxj1m8jSXIzy55NiD8pahMssDjQM95ka
	t/Hyo6T51kB01+NxfNog5NNkiL4RfnIieHD28J58cAG54qPgNEoorDJQ5aDjfVH8
	j6BwC/ZtLan4PBtu5RfhWIxS2T4wOi9IeIofHBtu+2S4hY37CRCaWdD6INMBF+0r
	zt8Vr4q8Czju/z1sye9Lw4tt8aTH4SWN+g8dPSxR/Pwm7u+1zWhJJSZZo7jeaK9e
	5wJe9g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x94hj18t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 23:36:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 491NaQBl015538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 23:36:26 GMT
Received: from [10.111.183.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 16:36:25 -0700
Message-ID: <36130760-b396-4c4e-ad1a-dbe8415fdcb7@quicinc.com>
Date: Tue, 1 Oct 2024 16:36:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Support DMAC Reset Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
References: <20240926051110.2477814-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240926051110.2477814-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qwoguz48oYRNsv7ypag8f-xh4VipsMeM
X-Proofpoint-ORIG-GUID: qwoguz48oYRNsv7ypag8f-xh4VipsMeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_003637_459866_BD3EAD2C 
X-CRM114-Status: UNSURE (   7.47  )
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

On 9/25/2024 10:11 PM, Roopni Devanathan wrote:
> From: Rajat Soni <quic_rajson@quicinc.com>
> 
> Add support to request DMAC reset stats from firmware through HTT stats
> type 45. These stats give debug SoC error stats such as reset count, reset
> time, engage time and count, disengage time and count and destination
> ring mask.
> 
> Sample output:
> -------------
> echo 45 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_DMAC_RESET_STATS_TLV:
> reset_count = 1
> reset_time_ms = 8036717648
> disengage_time_ms = 8036717648
> engage_time_ms = 8036717649
> disengage_count = 1
> engage_count = 1
> drain_dest_ring_mask = 0x0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


