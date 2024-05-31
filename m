Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24BCC25B75
	for <ath12k@archiver.kernel.org>; Fri, 31 May 2024 19:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJp1vyOYt4eO/kBpSnlZuec6ZaNAolkogRbKhRnSxcA=; b=jH1HGEXCp1IpgYMN3tJPBLpLiV
	flD1WOt9NPY09yuRWqjxtw3DNVMq35+gmpCgaX0OqcQDxnJ8wrkAdm2FugxIjbsIweSrs/yUl8jBa
	L8bh8Q+VIefCZtZdaV2J31/4x0IKTHcQhuvM7W6QIdzRIpDHi9GXCz+P1/5hKAoGnqILfd8wChvya
	rwFIgDaBtw8MGbVFAitkHK2vnFhdg36ruxxrtf58LoUUporgN9h3MU2z5g315QrnuZaLEnmrYFXlz
	YbypFrGwr9ljIBN9B/A0t/hoALeCFzy3Oa9gqQHukKL8+lC9jzDAwPKUsXSebMReCJpPyghQkZ5S+
	h2BNmsCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD7VC-0000000BBpr-1bSJ
	for ath12k@archiver.kernel.org;
	Fri, 31 May 2024 19:01:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD7V9-0000000BBpB-14Qp
	for ath12k@lists.infradead.org;
	Fri, 31 May 2024 19:01:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9pKDJ002210;
	Fri, 31 May 2024 19:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJp1vyOYt4eO/kBpSnlZuec6ZaNAolkogRbKhRnSxcA=; b=BzMdB6+y1zzVGvgz
	yNMZ3kv97znmNHW9txvy2K3y9V2LDTq+LSC+vct/axIzvI3NLq3gM8lzyr5/LWxD
	UIxYFTgdmAmbR8M1BNVTz09YDy4Vn2KKqIs+iB6g/xcZz+XgyV+p1XXlQwpzv85n
	+v4V9j7EXwPZNJfxrYTWYtDYICTIiG0SoteX9nEk3lFUZlhh7paH8PN18tN/Uk5P
	EjZ2dXflMRigtBht4t2EgMkZkbdCpr/xaN6IZeycSJicf/9S2IItbGM0kBM1beMo
	rYs70ozLNiDN6Q8LrpmyMNoTsrMR1QIsdt4zmA0Z/JgDM8oKcK5eC5j+sCnajIV5
	sUbVzQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfc9nhgrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 19:01:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VJ1D0g004364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 19:01:13 GMT
Received: from [10.110.11.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 12:01:13 -0700
Message-ID: <ef9bf058-7821-4709-9c38-84f2b8b693a6@quicinc.com>
Date: Fri, 31 May 2024 12:01:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix ACPI warning when resume
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240531024000.9291-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240531024000.9291-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nqjGzR-JXXm3pZ0zAZ7n4akGP24XOqz4
X-Proofpoint-GUID: nqjGzR-JXXm3pZ0zAZ7n4akGP24XOqz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_120119_456720_DBD698D4 
X-CRM114-Status: UNSURE (   9.87  )
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

On 5/30/2024 7:40 PM, Baochen Qiang wrote:
> Currently ACPI notification handler is installed when driver loads and only
> gets removed when driver unloads. During resume after firmware is reloaded,
> ath12k tries to install it by default. Since it is installed already, ACPI
> subsystem rejects it and returns an error:
> 
> [   83.094206] ath12k_pci 0000:03:00.0: failed to install DSM notify callback: 7
> 
> Fix it by removing that handler when going to suspend. This also avoid any
> possible ACPI call to firmware before firmware is reloaded/reinitialized.
> 
> Note ab->acpi also needs to be cleared in ath12k_acpi_stop() such that we
> are in a clean state when ACPI structures are reinitialized in
> ath12k_acpi_start().
> 
> Tested-on: WCN7850 HW2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 576771c9fa21 ("wifi: ath12k: ACPI TAS support")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


