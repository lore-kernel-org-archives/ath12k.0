Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2137DC369CB
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLmEiFinkCqTOFKl1HpXMHgW01j+DjPbWxjINLNw8DA=; b=wNV1d89aKq5uYSLv4OBrvyF6Q8
	/3dD2Q9yNDwG9r+X+XmMVY2ks4GLKYLUQHaiU/axNmb5j5n/v1N9rzAOa4+8sPJiuD/3VkCD5KOJk
	1cyecAp/8b3IfigR3jDdTw2hIwwdkwEH0wCc22B1tperMYzlPXzQdkoG9hGOYs++/ijwxeYflfShs
	0mTp8wIUkxLy77TC2NZo1ren3j+4jtnUpBVd3SDzweMF9gVxmGYyrc9CfrfK5uqiR/7GcBpmpAgT0
	yK/wvOhoZAYmnU6xmthtQYh3ZWo3UKvSIvYKIqsW7ECgpwftz1zmwUMMjyS0bMBI9Zm09gmm5cOvT
	vK9PO7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAv-0000000EVPq-2qIR;
	Thu, 17 Apr 2025 22:57:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAr-0000000EVNN-0eoL
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClKfd014436
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLmEiFinkCqTOFKl1HpXMHgW01j+DjPbWxjINLNw8DA=; b=dYjYUdMyEy0x/0YW
	ad2EnQpg+smjQn184JdJtGXq1Xf/emCSpN/miqogl9b3OpPr2GiPNPVqxTVKQmRY
	qELPgrHQfbK3N2jyxd7tFRZQHc78lx/DClBlQavySabNVqQFRT7OX31S2zppow8h
	YaDFBRENSLqIsNjpA1zkIJhRieTkJRnLhVJHhDHiM+35aEB8EdrCCZgZMpCWnz1W
	V6qQ3zAhUdmVfS5HfBKYMS81suYGeCYZpPCiypRNpTMyl9g+o8gkAFsAuJcGVr3z
	Tq8KGOK1LS2sU9/zTKSJMXWxwjx39/onlx2QpMdahZ4gv8s80bFPlV4C2EN2paSP
	LSFybw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6rgxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736cd36189bso1514296b3a.2
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930655; x=1745535455;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLmEiFinkCqTOFKl1HpXMHgW01j+DjPbWxjINLNw8DA=;
        b=Kvq0VzYkGl2c6zbJ/hsfffjdXnXgKtUNdUyAPJdNVuZQthwppK7J1n5R8S+wknWcrm
         ZzdCix3S9gycx7NJVn/7cMB6EKVu9bibuYYdYQsVas49/ESVsos6ldLia8sS6cw8hdjn
         XCnKuVbrDp0MnbPPLkY+BFQKqdifs7mJh73lQa2b9f1aXiDhPK2dmGy4lKeQF3I2uj2W
         BIB7PLtackv/iGsNVvvBpffyj6Jh5OLpoMjlqtT56zDpETo/joNSULdwgXe+IFyeeEHs
         XRYJ9mUlX3i+BdnC68WjTVtC1gjt5LjKezHWtys67h05Q7Z5FwbqSxlIrhMCunOwNaTw
         pn2w==
X-Gm-Message-State: AOJu0YxV2XlEqw5QB0mVpchpSgWtkLCJQ2VMt69F8M20KEilmRSK3kJe
	cR1cCHT4wx0JbZyEYngPSLfjzQYxj6flTuYYY9DBAeMkA1LshX+qmZ2XUGZ0qithqJDyQzYfVH5
	SIq5O21vGMODUe5ulzUvxq2GVIaWZAna/4hmfj3M2h7aBOmdn/NjDkPz7SloD+rM/j7e+
X-Gm-Gg: ASbGncshDQqSOA2aK5dX8omjXikdoxv0/8F8dq3EtVJ1KHz3PcVE1nF8xHp/1WX4tkD
	6Z1EmTq/aa7XeboNwNYf0IJVrjFxPZLtLfLh/HXjoq00UC/mozl09YVwU5EmYodi5PLK05XHCsk
	L56M4ZzgcEb/4nKqdIma6CFJbphHsXLzScK+1X3bdrTGLx+9LU8t9cv+ZJfgaAkxBlPJpspb6A0
	hX6ciAIoJBC8uhWXKOQ8h1CT7Vk1fi6qZJqyr8D1mZTl1nAMcMz5iXsA8woOwS3T+kgy33MXcvY
	SI74NvvPmbf6jhMOaKRRbrw3fY+7EJpjO+HnYrimun60LJBh
X-Received: by 2002:aa7:930d:0:b0:73b:9be4:e64a with SMTP id d2e1a72fcca58-73dc15d8d05mr694986b3a.23.1744930655380;
        Thu, 17 Apr 2025 15:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5Xdz9AwF0M7Ydwx8V+qE+zgm+QOcKbsYU1sDDQ9MJv51sIfJZQ/MbTnEQ0hyoJ8wf0pQppg==
X-Received: by 2002:aa7:930d:0:b0:73b:9be4:e64a with SMTP id d2e1a72fcca58-73dc15d8d05mr694957b3a.23.1744930654858;
        Thu, 17 Apr 2025 15:57:34 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:34 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <quic_sarishar@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250411061523.859387-1-quic_sarishar@quicinc.com>
References: <20250411061523.859387-1-quic_sarishar@quicinc.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: correctly check RX
 multicast bit
Message-Id: <174493065424.1347382.16677408754808794980.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: vHmbupnyljPyd8M7viPNmhrYzQIOyLI1
X-Proofpoint-GUID: vHmbupnyljPyd8M7viPNmhrYzQIOyLI1
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68018760 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=lyCGXvvuIA_9HnfeN9EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=591 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155737_203316_93098362 
X-CRM114-Status: UNSURE (   9.65  )
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


On Fri, 11 Apr 2025 11:45:21 +0530, Sarika Sharma wrote:
> Currently, the RX multicast broadcast bit is fetched from the MPDU
> start descriptor. However, in some scenarios, the value is not
> accurate. Therefore, changing the process to fetch the bit from the
> MSDU end descriptor for improved reliability.
> 
> Sarika Sharma (2):
>   wifi: ath12k: using msdu end descriptor to check for rx multicast
>     packets
>   wifi: ath12k: correctly handle mcast packets for clients
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: using msdu end descriptor to check for rx multicast packets
      commit: cb7433cc5cd4d07175dbc41f5a19966e9fae48be
[2/2] wifi: ath12k: correctly handle mcast packets for clients
      commit: 4541b0c8c3c1b85564971d497224e57cf8076a02

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


