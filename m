Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D583C4167D
	for <ath12k@archiver.kernel.org>; Wed, 15 Nov 2023 00:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1IvzhYTjuTnUBuXC53fagkOAEjYbEL9EaIyQRjJBjU=; b=l75FFbM+0HQYDU
	0xG+KH/Y7lrJtNkNPpwYFXiwIe7mDoCx77kIySj71BY5z6nK1epD46vxhPXuV4urXkneGA2G6i2Wn
	DwnI5meRR5kz7crflGczKiUAtkKexv6xt3hGYX6GIQEEWW/Jbt8ktITXHdEbDK7rtKhAy3w913uQh
	YgsrBaHCSS8yoWQf8Xb0Zvb1Db+8yLgsRdtmdTe0uue6M9EcRN6G1PqgOrcdBz95iAuaLJlgtmdXY
	VDAnbm4MzTjsBbVG7ARrg81yBRWc5Ki7PcwN1jf0KRztkU36ysXhSDr87EFZFOjk2oiAm/sqvGuBn
	nu4uSpUQDTHQuW0Uvpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r33WY-00H1I6-0o
	for ath12k@archiver.kernel.org;
	Wed, 15 Nov 2023 00:12:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r33WU-00H1Hh-1f
	for ath12k@lists.infradead.org;
	Wed, 15 Nov 2023 00:12:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AENKPAV023546;
	Wed, 15 Nov 2023 00:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ijccHGA2xXwY8cxN0fLgyW65IjRrkPA+CeTrnE0SRgg=;
 b=asaBifqMnfH1Urbf7Qvye08xF3FYqMta48G60NkKTtEaI2acltYaupqwVdQKHgDzqUni
 SYIPV/btJtX4b2YP4UTTm0wfBmb2O0nYTrE4oLAcdST1QWO/WHckZg8mmztQkdbJTzjQ
 C82+fp9h6fwlATT1c8vlPAWZ4hL6yL0C0EuUiswCz8wMT4KwTU1OFlAr0IF0ORA+L4XV
 2jP14ojDkfx+IZ6RWxx0d81K9tuj8bp5yxauc6Oigwcrs6Jc16vsSC8SXnhfdpkWVdM/
 I5ufoPn9sJPKziAjw0FBqRlEa5VK67G5cl7pyNvmLFyBnv+x23xcfvQ+sBLJjxlewHMQ wg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucanq1bet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 00:12:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AF0CiVr022676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 00:12:44 GMT
Received: from [10.110.49.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 14 Nov
 2023 16:12:44 -0800
Message-ID: <5f41c0d6-f172-4b36-84bc-cf7ac5d694c6@quicinc.com>
Date: Tue, 14 Nov 2023 16:12:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: add 320 MHz bandwidth enums
Content-Language: en-US
To: Muna Sinada <quic_msinada@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231114183314.2846274-1-quic_msinada@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231114183314.2846274-1-quic_msinada@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ik-DV0bEDuYyFGzI9WJiVhyzTTMw_3qf
X-Proofpoint-ORIG-GUID: ik-DV0bEDuYyFGzI9WJiVhyzTTMw_3qf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_23,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=505 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_161250_708556_DE36B013 
X-CRM114-Status: GOOD (  12.77  )
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

On 11/14/2023 10:33 AM, Muna Sinada wrote:
> Add 320 MHz bandwidth as a new bandwidth enum for ATH12k driver. This
> is extending existing bandwidth related enums to include 320 MHz. This
> is a precursor to supporting 320 MHz in the future.
> 
> Sanity test performed to confirm that there was no impact in existing
> bandwidths.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 3 ++-
>  drivers/net/wireless/ath/ath12k/dp_rx.c  | 3 ++-
>  drivers/net/wireless/ath/ath12k/hal_rx.h | 1 +
>  drivers/net/wireless/ath/ath12k/mac.c    | 8 ++++++++
>  drivers/net/wireless/ath/ath12k/mac.h    | 1 +
>  drivers/net/wireless/ath/ath12k/wmi.h    | 1 +

Can you update hal_rx.h to have a 2023 QuIC copyright and then repost a
v2? I have a pending patch that updates copyrights for all ath12k files
modified by QuIC in 2023, and that patch updates all of the files you
are touching except hal_rx.h. Your change is the first modification of
hal_rx.h this year.


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
