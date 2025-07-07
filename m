Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE65C83F0D
	for <ath12k@archiver.kernel.org>; Mon,  7 Jul 2025 22:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YApgcEfLhCvcv/oL20l3XARkGnqSjmZOVD1/d8EkdQk=; b=Rebay6VGM4ZU1bAnseiKgMK0RR
	0zrkg09y/eB8ygpZLVtWM53Fysz552dRxyn5yKsRPm4vzjFK/w8Fu6xBe6E0zY9ZVlqjAhqkA1cQF
	g0xRNpjlpLsOOLBCMJGNayXS70wwsjSNZgtYoMj2UdB58knCRagSyWyU/YDeOdTIeomRc1Hft7xUj
	K/ZhGEclfG0N7J5vHsVWGKsz1eCv/2kssINtOHn6VrsnC7hth2uJvx9TZmJKR0q8u4tci4jrx8KcR
	n51Xupt8M/Zie/70TXrOb/6Ned5tDJL734YjXXpDZ0BRD+uPLSdh1Of+iogOKqkmDeWO34p9/Ucg0
	n5wTf09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuRq-00000003ihT-17nS;
	Mon, 07 Jul 2025 22:36:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuRm-00000003iek-41qj
	for ath12k@lists.infradead.org;
	Mon, 07 Jul 2025 22:36:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567E75PU029869
	for <ath12k@lists.infradead.org>; Mon, 7 Jul 2025 22:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YApgcEfLhCvcv/oL20l3XARkGnqSjmZOVD1/d8EkdQk=; b=GVdQw7W+vm6CBM51
	+4+2ADPoh99kDKX7CiNs7o2L+Q8axnH+RG5NXPwdA6+NaiYybNTaKmwBG7U81Qnj
	URbguy7SCHK9TFjsXDlTUj750fUho6lr5oc4q4ZVvJ1MT8/URcxhSYORRNW42l/s
	FwpLPCD4GwXa7IuatT2ZKplXDrNRhz37G5JHmzt/x46/ODxM+Q+EokC1wzW4xmdY
	kmgv/v2Ytiw76K8xD8hZ0UfkgLcMkHEZS32zBfVVS3qkem1jCdCofQPL/Gk/aA5P
	Z6H+yAWYxGvOS3jp3J8lunGKHfsJ9a75ZSF017BBaB1YKmgSj8HUsBXj7w1Ks8yL
	+3cnrQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47rfq2u8h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 22:36:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c36951518so4427690a12.2
        for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 15:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751927784; x=1752532584;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YApgcEfLhCvcv/oL20l3XARkGnqSjmZOVD1/d8EkdQk=;
        b=lLoC0JrKm6IfAVr4vmW3ZS74YpuqQB8KXS6L7/wHd8Y/MPL1iTosil4fxGmJqy3P3y
         OabopimiaWpY9R4y3IBmZSHhQ0A1lXPXagIWvF/EX1Jj/gxTZOa0NFQOJFKVh9jWY5Md
         /o5QnFZogms04G2oXXiAlaNwvaLuV8q8lvs9/2KA0Aq8M1PZpTyKgYBa5NYXzEq+LaGy
         sfBmtO5VxHBZSaiFQIDtMTWFUZG3eq/SSaxoWg6SD1MqUv5nEETRHAL1IvGpWPG20hzL
         kLTX4Ra8qhEr53e94uhvh1MkYum2u+nh8ITfa2GRq6lMlhxGg2siN01pui4aqbF3qAPN
         9Qsg==
X-Gm-Message-State: AOJu0YzCSAnFATU1A48BH0SZ9DScoryAa3iTOZuadomyZ6iYZWuBW3eV
	SipR7v7eCFIiKxtVYMwM7BzBxvey9KQyKIK/w4Hrp+7vLe9wf6EUlHbhwEDE/g3QLC5DVkSdgHB
	0xBocpdfGh/uKl2zndbo8l7KPgJh3WU0ioBft9Mzu1IRIVpFgguXx6D9w45AA5UzMTGHW7c1n
X-Gm-Gg: ASbGncunMSI8hJu1Py992BNufCWuLHBPZIsdgA3MYRtdeUyQ7l681hma5f/7IDAmUEL
	oDJ2PQj6ZNRfrh7XOwdfr8BlgzKS2/+XClR3iWCXffQVX+a/YhzylTw7QVbqR0i3B+Wx2rB81Nm
	8Fl37LX58ieDXTgne4lOIk126TH+1vtVEQYcb3QWKTNEwyt5m0NOXAWq6XKcZP1Z2Nof3M2iSLC
	xyDH3lpbhrApQz9vu/yXVUpZ4EvQ+fzd/YXm6co9tWdW9D7WInpuTwEr0+eiJ16O12yWoQHHepv
	pPHlAX84h1kratcdxB7pKK0qYiOVb8Yz2p/6786JzzpioMS7qxyqZECtL14=
X-Received: by 2002:a05:6a21:6da1:b0:21f:53e4:1930 with SMTP id adf61e73a8af0-22b439d14c5mr1232070637.22.1751927784554;
        Mon, 07 Jul 2025 15:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT+sWByQ2MdrJ8iMs6QfVZt5E56GE3YfUbHnEbFwa7fOfWuomg2Zr9UHmbiugrJtnr/ylgZA==
X-Received: by 2002:a05:6a21:6da1:b0:21f:53e4:1930 with SMTP id adf61e73a8af0-22b439d14c5mr1232042637.22.1751927784105;
        Mon, 07 Jul 2025 15:36:24 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee6358edsm9668064a12.58.2025.07.07.15.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:36:23 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <quic_sarishar@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250630064431.3446333-1-quic_sarishar@quicinc.com>
References: <20250630064431.3446333-1-quic_sarishar@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: properly set bit for pdev mask
 for firmware PPDU_STATS request
Message-Id: <175192778338.314276.2561875360399955703.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Jul 2025 15:36:23 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE1NiBTYWx0ZWRfX033VecNFaN+T
 wcgbTCTKokJxTI4s1m7erUdICKpVpfxpnNEIasO5EZ1Iy4Uz9iD1dAATuRwoLy9YLGyBS6S7hUP
 zeTME4ZzeBqUr2khhwKnIMAq8NYZTjMJxIaCUwOjF1LKJZeqHOAajhaeexfITYTCvXPVgf2tDgu
 aUvKUYnn5WZ5xa/Z7NhJ7cc3OPfssVfA4UHJMf18VCgmxsGrceyzMy9UIzpCQwlI+K+lqFv6BEs
 AAMKW7Sa1JcF8JKm9WpDKf4A2n7QYPYlL9Dj+IkGX0u+BR2ZSFn7vHzl2VBDynamaaJPX36NSj4
 BNn70eO/jqRYnvkEUaoGukNSwH1eUhWs90erhBNAs7P7hDhdaWjzrjk8NKYpsqEOkOdEfn9KFYJ
 BUbjhQtlK8svHA+w/TTHxuSdwaqm72DKdW3I1mLdeEMKgfhYU7G4HTxNhF0expBfPe6G4xPK
X-Proofpoint-ORIG-GUID: hSAKFE_3JC148LI14R6gJRFhHo2eDmNn
X-Proofpoint-GUID: hSAKFE_3JC148LI14R6gJRFhHo2eDmNn
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686c4be9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=baoXswmsWw0oUJaBrHEA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_06,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=987 spamscore=0 impostorscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_153627_124322_63C8824B 
X-CRM114-Status: GOOD (  11.08  )
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


On Mon, 30 Jun 2025 12:14:31 +0530, Sarika Sharma wrote:
> Currently, the HTT_H2T_MSG_TYPE_PPDU_STATS_CFG request uses bits
> 8 to 15 as the bitmask for HTT_PPDU_STATS_CFG_PDEV_ID for firmware
> PPDU_STATS. However, bit 8 is reserved for SOC stats, and the actual
> PDEV ID should be encoded using bits 9 to 15. This leads to incorrect
> PDEV ID encoding in the request, causing it to either ignore the
> request or apply it to the wrong PDEV.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: properly set bit for pdev mask for firmware PPDU_STATS request
      commit: acab697c32f7a38ec0e9721ac02febd295e8df74

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


