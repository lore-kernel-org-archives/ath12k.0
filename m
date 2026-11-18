Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A95D60A2621
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BAC5j7Tz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGlKndFc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ID0zzP3u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=; b=BAC5j7TzvzhMAGAH+J4basz+QL
	v88Y1nINVrSPesd2hQQnfo1zAtJQLLtx/kGOG/Z4n1t5Wx5GgNFE+b+ayafKl63AYo7uU3P+wKTAN
	5zbv7qJOEdrd/9JvCveFHoZ98UDaaNR0eT+zCcn/AG8h029pLcxpwAl1XkYqPGudlEU7yrThAiv7j
	D26cvMu2EKkbKJY9MEEX3jbCtG2u0cId8CRZse3e9g+vKc9yih+L09SKw1bjz/x61wbqyVeNMZOq6
	kYjoRLkY1SovpMw0/2l8FISOZ+Hn+1V0feRE4oBJKGb4qX80qVN5Qovf9JW9zOqyyBKjdZgib7M/U
	1zYdAMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkZz-0000000A0Up-0fAg;
	Wed, 18 Nov 2026 18:40:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkZs-0000000A0TQ-3iQj
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 18:40:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGbBk1843713
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 18:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m5cQENhe23m5PgLRsf7Y2D
	PL3GNLV0D7Ho+s5GZmWxM=; b=VGlKndFcWhJ2ohpvncpq2aeIaMNAUK4KBlYATV
	E33UHXxtn6JRnIFvvJeXCOKDy8RgKpPrXTb5mfcQFp7/oiS5LE+Sb0LCioFzLVFz
	XIbeUd4KhOXJHwJ4O5k6qv9ZZ1Bef+GcW4EZAAejgXZ/6Nza79lW/Hm6XnJvl3yT
	v5WVcNeaLp4uUg3kOS5EfvyfUkZnBK8brF1QHXAUyhD6XE9ykXaEwjz8UjKJXoNh
	9BWwDb+Mujz+0yM7zCNxH226RwXTFCMBuUtcgB67u1E5e0AhVx4qx/U6Vfw5fjxh
	3kDur4CrBh6CRuZ50XGey+JRjGNtR6JxJIbW2XU6/2f0kmvA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrs9uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 18:40:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1683752eec.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 10:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027215; x=1795632015; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=;
        b=ID0zzP3uzOEFZQ77d9vq1BgwF/bqSmAMx2DDVydk55zYf+tRrCnM36cqkG/OqtLgj2
         ed7krrRqVWkhi9rW95ZlhBRp07pwPTitw+yGJXLIue34JxiJ+ZLBbFZ5nlhN0rxIMx3L
         /8lkca94rlvWuJwrEnLyl+5mko7JKViBLZA+clCIpJRr5QpR2z5Z8ulzzJN8bsYlan05
         AEOUVQUfGX2A7RrRvLleJfx7sEmCHS9k75GFxTmmZnls72JB0aPd6YdwR+9ieSLTIXLo
         FpRIyW7OrY3wq15x0se5S8dj5r3IXOYJhRYflxWqDnUVlNPem/hPFRJjO5+YuyM3OT49
         r80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027215; x=1795632015;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=;
        b=hiVqiWEfAm16CpS7cGXV87xoS0YrJpmU23ESmU7xft0GyhD9Vgii1zpQdLnyF7mFV7
         G8HP8YlkKM0aIpbvPN+uKQPkm6iOPNGGkprPptM/iSmTcUtDOOj/sqZ88jV9DZi0dhRv
         aW6MUaDwcJ9cEYc+yi/WhTwAIY6oaRy4DEiIrUoYJI+a0S7c5xkURO0HdaLFJsC/x4X1
         aNjnwz7+rVOtXC+t7ZW37fz/f2lSVpCfe3nLjV1KP+PUPcMImv7S/vStO/L6gUg+YjsR
         mjJLCv01kww+ZecjYLar0mTb1IQ7/xjQHKq08xMlJfLmbug8bcxdWpVljBRjURXI9uig
         ILwg==
X-Forwarded-Encrypted: i=1; AL+hErGYdT2XozGNfZwbLJ5J1FHvf/+Xy2TQrOL18F90N3DSDGuDYEjFbXRj3nehy0eR34FnH5Pd4qU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+RL+JYwa+/TkVxw0Ox52wGgxqYtMyQFBkJ8Oaer7AvKWWWH5YW
	YqfpLHp69RA/l7LEHYZ6iPHFppnEE94rHWv2wMw0mmEbA5/aWk2PeUD7H6pVHxVOacEI0bIUz5X
	LhWKNTKN3LqPNyjS+AjhgjeGoyY6PjYQ4w2zmXx1JaEy/woV49YIIvNzbt92b5Ayx
X-Gm-Gg: AYBFou3cdd0r/WpdZMKWt1mp5Zei2XjZTcwzS14QpET85w/RXqGF54Kno66UmyzlUgw
	I5rxqmte4R6il+2aBfxtjv9Nr+Gzzq3zYh0k7RrVWVpXkwg6dHe2WGNbxMDI/iCMJimppKkRb02
	A3Be7OJE/DbUEJbiQoJdLk2b8F7VuwvUsGg+ZSEj4ckmUw0YpYsbA75seWEsrIotBYcJveES1ZC
	fd+7DmBnkLGNtgPz8qbVXHTW3F5FLcn8Pl5BnYcSirjs/57F0FA7Yo1zBXBI4/B2sATujJPZdq8
	BRO99dxQtv1fm0jAU/THhaACjO50r5POUeG8NTT1EJWPb3tL4I1rX/QagP7WsZURY1vO9CFzDql
	O3dEYofREDzyShDv+dr0u9IY2owmwQ8MVEBWm9xHgh373q3hnmnYRVretN+50U4hZgwUn3J3MLR
	p+Dc0nMgLD
X-Received: by 2002:a05:7022:f90c:b0:1b5:58e:b544 with SMTP id a92af1059eb24-1b543ce6b0dmr3050812c88.18.1795027214546;
        Wed, 18 Nov 2026 10:40:14 -0800 (PST)
X-Received: by 2002:a05:7022:f90c:b0:1b5:58e:b544 with SMTP id a92af1059eb24-1b543ce6b0dmr3050777c88.18.1795027213630;
        Wed, 18 Nov 2026 10:40:13 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm8126886c88.3.2026.11.18.10.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:40:13 -0800 (PST)
Message-ID: <9f678c6c-6446-4651-94dc-ff3763b5dedb@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:40:12 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20261116
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfXwASUqCX8xDW+
 wa3SVknR7C2AGwRaygC0BtkRy12ykYXamIH2nb4Lsq8QdWYxH3FHzZjy2xLZadILAIeWKCu0LdU
 KTEhdhxcWpWA8McyasTXfektn0OwNo0wkuJklfRKh6GAKNlPXi8ZDFmKQfXmC1NoHrnElMQhc7U
 AgqnPUibAiBZPeIlQRB0A8qLvG/TfERcyskueAkTF6XclDGrT/Q7GMEpwgNucBSmyccwSU+Y03r
 DufNOpBUzlMBBHmDGtbIy/dhLtzVZyyDc1TN15su2VT6KNkySa3S363N+04A18kkoXo4VzV6yuv
 Z5VPZEpGhwT1nW8sFFxzdEECvUBB5wf5LrKljBjl60ewsSSI8DftpAzkRy9Lnj0Ql/ReZicw+Mm
 e5UUv/NO1gtkmho5XJJRITx5qjbZXdBoGuT0ndrO/zv7KilNpAQwsx2vx8nhggNyOrCTfcwUdE8
 Tc7laEbFGTmpPF52HbA==
X-Proofpoint-GUID: hib92AbrW7uu4NXH4tEdbzF41McNCTRP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX/vQYbpkwhCMg
 u/c0agTTh+uLNPMYFRL6yvxeKBbsBl7PxqFrW6x5wRrUVNfl8cbm9imrGLVDVIDS1mibJT/iU+W
 nvucntKOasUbTdVwJ8JkXUsTnw5L2u8=
X-Proofpoint-ORIG-GUID: hib92AbrW7uu4NXH4tEdbzF41McNCTRP
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afdf10f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=XwkA41cYJLgbl9f4RuAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_104017_035812_632A7895 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit cb1edd20907e13b058c0d5bd34c9d51b5bedc879:

  Merge tag 'nxpwifi-fixes-2026-11-03' of https://github.com/nxp-upstream/nxpwifi-next (2026-11-10 21:16:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261116

for you to fetch changes up to b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a:

  Revert "wifi: ath10k: Stop unanswered temperature reads" (2026-11-14 08:13:06 -0800)

----------------------------------------------------------------
ath.git update for v7.4-rc4

Revert an ath10k change that landed in v7.4-rc3 since it has an unintended
side effect.

Also in ath10k, correctly report the status of bundled mgmt tx completions.

----------------------------------------------------------------

Thought I sent this immediately after I tagged it, but I guess not.

----------------------------------------------------------------

Jeff Johnson (1):
      Revert "wifi: ath10k: Stop unanswered temperature reads"

Shunsuke Nagashima (1):
      wifi: ath10k: fix status of bundled mgmt tx completions

 drivers/net/wireless/ath/ath10k/core.c    | 1 -
 drivers/net/wireless/ath/ath10k/thermal.c | 9 +--------
 drivers/net/wireless/ath/ath10k/thermal.h | 2 --
 drivers/net/wireless/ath/ath10k/wmi.c     | 2 +-
 4 files changed, 2 insertions(+), 12 deletions(-)

