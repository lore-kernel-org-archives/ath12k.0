Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17697C197A0
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 15:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPO6iPgQ7Gx6rJ6I38KFZHJEVYSBM4qaZTLZpjtUOYo=; b=SEbVNqoPfBqzT+
	sn1iG4Mo4481MVsjCx3YREhGd+g5OuV3a3bg2hG7KdMuXHTgZQJeMjPYuqoHtPE43Z4peB/jej5dB
	VxZaiPtKA5C4ngH7RQ67H4XtAMxllDV35eZzJlD/rGok84lgix0rK9xfds2b9E3LzAq8G6F9xwJsL
	eWnKiIukMEYZwJZePNIyfC/3JqEMjfEaTe50+mi2mZFYNipf14HZKljYnrZMI/pveEmOqc06SX0K4
	XBw233G89p0XHydsr6MuMV+G4lYoxUQC2bkkBwmsb7nVew5UHh3TR/IEOVle7yl9ieU0VVuzr4/KN
	W/0LmdlPRp4iipr81nTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r56Zn-00Ct9H-2a
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 15:52:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r56Zj-00Ct5y-1G
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 15:52:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKELA1M025735;
	Mon, 20 Nov 2023 15:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZwOgqASGRmLWw6gQQ7zQBzUUxI5qYWWteH/51QgaGGQ=;
 b=foU7UMzBekPvg1pk+6XZuIyoxZxNbm20xUKzE205s3xaH5Pfg2vattp6ndxayW8Eo4O6
 gsr0aIOVkI6kV0tRGnN0TLItiu5Bx0GqxjnaTaJNYc3wDzdW3+3nPcwytzOu0CK2CmQj
 seqeq1g/M+V5HkPWIyGuWQ5EcjKOo/4BrrVDFqrMsMCvEUg28O2LBhOAosuYjpnc2AIL
 oZsQdXov+44BUS4mv2+LwwE5hcAb1LmG35NA3khwJfrm4DM62UobDtyEjnxGlFGEUTBw
 kJIvJAshO5y2HmfFDNk+gd/OiDteJndofpjUDIapt7yYwojIzC/IY/hAIg/uLavcec2G fg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug5370u0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:52:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKFqcXY013589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:52:38 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 07:52:37 -0800
Message-ID: <dbee50e0-60c8-4296-97a6-4b0831af272f@quicinc.com>
Date: Mon, 20 Nov 2023 07:52:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] wifi: ath12k: add CE and ext IRQ flag to indicate
 irq_handler
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231120101543.4369-1-quic_kangyang@quicinc.com>
 <20231120101543.4369-3-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231120101543.4369-3-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bO4UXSrpq6FdtsBK8ETsV5CRkTflSKOC
X-Proofpoint-GUID: bO4UXSrpq6FdtsBK8ETsV5CRkTflSKOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_15,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=260 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_075240_209167_487BA260 
X-CRM114-Status: GOOD (  10.01  )
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

On 11/20/2023 2:15 AM, Kang Yang wrote:
> Add two flags to indicate whether IRQ handler for CE and DP can be called.
> This is because in one MSI vector case, interrupt is not disabled in
> hif_stop and hif_irq_disable. So if interrupt is disabled, MHI interrupt
> is disabled too.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
