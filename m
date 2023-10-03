Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDF5E7AD72
	for <ath12k@archiver.kernel.org>; Tue,  3 Oct 2023 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OH/+mkwjDjBGKSc68Cf8EHmVGTx6zOEvPeoTowtn4bU=; b=yVqJkz0/ildFR8
	4fumE+dgAdNu0n+gBt0mQKbD6dj/b/6DxIWgW4zwRbfj5fl5ZxeSP+4vgko6GnJxOapgiGs/lIydK
	Mdp8Yvu7mg/l1FxSlifjdAgm68jrEG+F6M0d1LejJkoEyM7jLJv3qConv6oLULgxuVYTT8TTZ7P0G
	tJ2VOfNgnfoDqo4Hjp0Nmi1QjWy9hBI9evwZWLOefV9gZaQZkz+sdIV643VpDZOrY/XocUsrrCrRV
	zoxRoo7l8FpJp/QvAKeJhVjSHwfBcTIW1ZhZJ8YSPlnZm6xc6GriGvGmPWOhkK1lnR3DXSTisb6XS
	XHpWRvTpiSOlgFyq+RVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhjj-00EujK-0D
	for ath12k@archiver.kernel.org;
	Tue, 03 Oct 2023 15:55:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhje-00Euif-2m
	for ath12k@lists.infradead.org;
	Tue, 03 Oct 2023 15:55:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 393FdGH2018635;
	Tue, 3 Oct 2023 15:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HUXyGXoLKhyYQeoVnJGMcDOQp0CNl54U8zFApb+wyvU=;
 b=mOR1T5ec9TwlP5LUINFKJBfiFdSSKg1kEGmBlDkKbvvna2h4INznZxJYkHF8+gtjTTZn
 c8DkvcCJcxEUfBS/dFCJiREVkuvcWMJAjANUMGxtzvhJjzv5r5m2ImJFifBleVee7v+N
 MMCBGQilKPU01VT38z4OWnIan6YzkM2mIlU+f0JExH8EU7dGfIm4Kll4sinGLYSo0JwG
 WLvltnL7SaHFs6n5wpR8A9g9CuzG1wKBbmi33s5hXb3JNENvaAjFsQZsIw7200xTwxlV
 /xQdCxICMAG2JtA+gM7nIe0LzXPSMruXTO3shXUL6bYavCJ657Zo5e4D+qMOm/ePznFw SA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tgbjj9f81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 15:54:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 393FstmF002725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Oct 2023 15:54:55 GMT
Received: from [10.111.179.185] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 3 Oct
 2023 08:54:55 -0700
Message-ID: <946415fc-f8a6-42ee-b20c-f6a895a2db4f@quicinc.com>
Date: Tue, 3 Oct 2023 08:54:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix debug messages
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231003150132.187875-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231003150132.187875-1-kvalo@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Og_jjKyYrwNo3ZelrdfklecqSZ3seJVw
X-Proofpoint-ORIG-GUID: Og_jjKyYrwNo3ZelrdfklecqSZ3seJVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_12,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=906 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310030119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_085458_906559_2C6620D8 
X-CRM114-Status: GOOD (  14.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/3/2023 8:01 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> In ath12k the debug messages were broken, no matter setting what value to the
> debug_mask module parameter would not get the debug messages printed. The issue
> is that __ath12k_dbg() uses dev_dbg() to print the debug messages which requires either enabling
> CONFIG_DYNAMIC_DEBUG or DEBUG symbol in the driver.
> 
> ath12k is supposed to use debug_mask module to control whether debug messages
> are printed or not. Using both CONFIG_DYNAMIC_DEBUG and debug_mask parameter
> does not make any sense so switch to using dev_printk(), just like ath11k does.
> Now it's enough just to debug_mask module parameter to get the debug messages.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
