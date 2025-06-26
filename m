Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCF2C7EE30
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpUrGZ/8sOs/7BIRrOcCuGlh3xzBiZUoba4pzlf4yuM=; b=HLO/Qpf9a5xryWREX8N2MZ01lt
	YvqPoP0pDX+hYrD0inh65goArUVRojFfyrCAN2BEHAERjfByVqHuE5I7rz+FlYZ2MfdU4b/MrBMIZ
	2w79pNQHnwlWnx+BA5fKth4FHF2qHsqPLRor7Ym13AUelX5noQwScxA9X5lrRNJBwtjgH789gVJJ0
	SfpjpaauKA7a/It0UlGbacDMHrTdYPvQR7LCG1dbS4exIDhTQssGGttp4OjMY/OzX9xwzU5hpKkB/
	St+T3kyYWSE9B8pzhVInHMNHz8nQXNOKbp+5AHkZoUUoIOrCtMftdLKP1rXN1YH5r3beTEj5Io7Ou
	6URHDnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuQ-0000000DCNE-1ILb;
	Fri, 27 Jun 2025 00:25:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoN-0000000D1zA-1eJy
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ2Tvt029541
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JpUrGZ/8sOs/7BIRrOcCuGlh3xzBiZUoba4pzlf4yuM=; b=goQpgdo/L1dxI8rZ
	SskNHlP0oIs2tkOsFFTaKRRakWYQZBUeUQcskQrCBVUB6xXOtyiE+nL9XBxiOx8R
	OJFSF9v362AOM4EOErlb1KDo/N9XCWaDkt/EvKF6jbRRGzljqFFD08FLnsQJ+Ytw
	O9fCGjXyeF2mTfEUdCOabiziJfO9jlhbzwTGn2pIitUakK/JrNdzCgVw5LzauRyz
	Z0ZRYI9hnNhktEaL4yg+IZ0bYqQddYxnPrvL1bS0i2DIvscTPT1ul8BbS9rowsE1
	psRlx82eV/WiU+alepO7p5jA1J0y5OUQyWq+48mp/ix5MTynfTK0G6uG0apQzxNB
	XCovUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4x3nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2358de17665so14801485ad.3
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979718; x=1751584518;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpUrGZ/8sOs/7BIRrOcCuGlh3xzBiZUoba4pzlf4yuM=;
        b=suATspHPVnO2LI+0nl/yNvqI3r7B+jtRJmfqIIzfinELDivsy9YiS/hOzbEL5gxfT+
         I1QDUVzE5hvr+7s+oNx/xyvG0ELaCYg/ghggUir5+OqoeLSk8SIOAyaFx3uExvaOvVbZ
         fHk5bumH659jeyvh6HCIRbd0on3sVV808d0NcVg4EZeTFUFy04AhIVJuKO/X3I2Bcq6x
         oAnvwySQ8n7640iB5QLTsvhz2RacRYUbltAB0/MMYt/QmrkkFPITJsNphsl7MMioKHxz
         kp6+ZpzWwzCd6Zg4KaQXwE7UyW8GdIMx1OxYHLCLnbgUyZK9/wwIqyLktoJsCAKaiYmq
         KL1w==
X-Gm-Message-State: AOJu0YyarDl6ltgOasHXCqwDn6qBXHQJx7Xwq7TDjHSi/zMoEC4m2Rxg
	L2iW4o78OVwtzZnVaL1UGkIZxQILJGJlAFJTWKOUAVt9c7WzskNXZ0q5ezpjXYm1Flcvx9aJJB8
	ciFaZXjMoBTvVyCjG2uZOI6bA1GYjaEz6Lu2ouPrE6VYKF32MkuYnBYJl1hQPyOmJvjb6cjdq
X-Gm-Gg: ASbGncub1WrAixQxGywTNEdFdyegdaK/ONyXppHUlIYhjElFdW6BXtXlqxqdv83wMD/
	NPEkM3y02yeLrmF9DpGxVClvwwqg+EEKvCeOpNiErtttehx0iL/tySceoaYSbB1MLCClRNQnzDG
	mf2lasqYMp8FBaqhH5kIhw21W2xTblyY8GKHN5LYjGNigzw6pm0dtmKqQW7qP5HSZl3VmZDwoIk
	yDgqDxaezLUUV/t2eXqljKs+w3jdhnsqiVmpQBfr0bZspLvkvZFGypidxodzKORuxlg1jWODYHV
	X+PJDMKeYgwrMEqzYiejEjDHY5ZDvy22LWPWuQBhDUHZkxSpiwtGWhlSq0c=
X-Received: by 2002:a17:903:1c8:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-23ac463414amr15616685ad.29.1750979717947;
        Thu, 26 Jun 2025 16:15:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy5LDu5rsUxR0pOFigKbIZekN/414KFHps9hjNJyAoI7aMDBKuAZ2qefbYsZG//fAZGwucuQ==
X-Received: by 2002:a17:903:1c8:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-23ac463414amr15616165ad.29.1750979717377;
        Thu, 26 Jun 2025 16:15:17 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:16 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Hariharan Basuthkar <quic_hbasuthk@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250606112316.39316-1-quic_hbasuthk@quicinc.com>
References: <20250606112316.39316-1-quic_hbasuthk@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Send WMI_VDEV_SET_TPC_POWER_CMD
 for AP vdev
Message-Id: <175097971661.153431.4409140578529794002.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:16 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685dd487 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Ca_dcU4mKi5WET8l3hkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: zVO8nuk0MGLtdlARhvcvMBucdF7sD6QK
X-Proofpoint-ORIG-GUID: zVO8nuk0MGLtdlARhvcvMBucdF7sD6QK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5OSBTYWx0ZWRfX6LBeG1CQzK5A
 2joo5y3x8h9tEvY77sRFw6NglFdIblnmgu3kv1pEiYA8PFvzaLjo0mA66Mml43qhcSbAGBzZhaG
 uD4VNS6BTzwwh72R8xQZsFZN7ajKnqlPPs968rOUeuVbIRZgmPjRw/xwLdf2nNTaeEseP9TR1QW
 z4SR4KPFJ3opoDnCFuOv2lghl6lKAQPU6DlprhR7kpsRkO+ZIwfyo2LYi3ncECXceSDuP2mrs4T
 mTYu1BaQ7mbJhM/Fq5AFN+8YByHhE7bHsK0kGCi7gEwM3SaZVVZFlDX16zgbcQ/5hyjWc3gjO6j
 /kwTd12hy4aS+KXTCMPZxf7B4jcBFEST55/3w1JDZPiejy/tOsi9BgkG9z+CyTCBeFuNJ+eXO68
 pg45qs36xWidDNvqBGc7ZQEz59/x/FCHFuAQ1X76IJY0DCVer7xRQtLxPdMHR7aY+iA3ES04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=793
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161519_448564_5F8E574C 
X-CRM114-Status: GOOD (  10.16  )
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


On Fri, 06 Jun 2025 16:53:16 +0530, Hariharan Basuthkar wrote:
> The power value is 6 dBm on an AP operating on the 6 GHz channel.
> This is a very low value.
> 
> On 6 GHz, the target computes the EIRP based on the power values sent
> in the WMI_VDEV_SET_TPC_POWER_CMD. Currently, this is being sent only
> for station interfaces and not for AP interfaces.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Send WMI_VDEV_SET_TPC_POWER_CMD for AP vdev
      commit: a44958c83e52238996a48e7d604167c9b9d0a529

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


