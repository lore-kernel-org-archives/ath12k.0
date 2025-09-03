Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897D2CA1005
	for <ath12k@archiver.kernel.org>; Wed,  3 Sep 2025 00:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTlL3s3wU08p/sYLbsbZNwCeQ/WfCrG0UOH18y1enxY=; b=HJ2gFJa+BXGROlxYtKUEU6bHwb
	jj1NpHBkLGfzM8YNpivSH4R9ffCR45lFS0G99VAmxg7ot0K20PwbwPrV6rpUej6c8FIheAtSnGudr
	nYNqMrqwliAtR4boimBaOPZi3rky0m8l8LMkPAsLc/QiU0Ie8jmx59qTsGYIGK+oa3WG5U0BkeeJs
	sskdopk60M+pfEGXOpwldXcilpVbukqkfkwWNK0sjwKLk6v2rJ/iHHzFbtFK59juqbK7/4QghtRXR
	jRcyDO/pMFgkedwZW3MXQc4C35QMlCGOagpDpkiV3jI+YriWGzgYXSNOtoRcs9o0p51CbXvjJSBlR
	3cO+mbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbf4-00000002uAL-0RDd;
	Wed, 03 Sep 2025 00:47:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbCG-00000002kJT-0zaw
	for ath12k@lists.infradead.org;
	Wed, 03 Sep 2025 00:17:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqECg023514
	for <ath12k@lists.infradead.org>; Wed, 3 Sep 2025 00:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cTlL3s3wU08p/sYLbsbZNw
	CeQ/WfCrG0UOH18y1enxY=; b=Qw25cgHAnBYpc2vYAjDlzDvnXCGfa9sQcSorDj
	iyWVdZBQyPq92VAedW3V4p01QufZ4y/qYw9gnfBHAx3arm66gkKMe5xaVNlYM9ms
	nRrNnLIER/DpYNN5L8rcH6GBQ03pQXF3WQwmdRXZUtlFla98ePghyjIIGhOuxkq9
	Bx8fx9Ljn8/oNA6RR9NvWtyox83LHosH+uRR3otVCBTsugTDpRpkzh1on2n6mHky
	B34AgdwNZCAYAaSP5Bn6OYzvTxvB/F/Y0O7t4AFLZUqtwih4CPX7u3el3S0KaP02
	CcAAaPuhgK6UYazKptefvx1rGAWu7BWoB/9fD3cZ6MLtizpQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp9t75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 03 Sep 2025 00:17:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4d48818a04so3666481a12.1
        for <ath12k@lists.infradead.org>; Tue, 02 Sep 2025 17:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858674; x=1757463474;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cTlL3s3wU08p/sYLbsbZNwCeQ/WfCrG0UOH18y1enxY=;
        b=nG2LmRNSSzsIhukn8TbnkxRlOpLWD8eEjHEAdC0wv7DR3+mp41GRCmWO0vg5MsdTsd
         jxnRj1XarL/Z3qHm0JP53bmO0UxBifvG9Dbsahol8KmWyEtn+U1xkTdRUMIyi4Qdxhjl
         zC1SbPYEFfOaUcJw8pONmoPwWbYW0dLPXNgkuBq4BxHh5Om9Ws9QEq0BWIxMamNyCHk5
         1u8nnPfvDEZjPBi403rfukFkWBxIW1rwqcAXHiZcOEye1ZAB7VhQhrNJL3huc/sQXmuh
         VRTLKtpHY12uRp0acta/49oKfvWSkc6dzL6gg/6l/fOOXeM/L6erD11ljgYgTJfyaxI2
         cTdg==
X-Forwarded-Encrypted: i=1; AJvYcCVeulTGcY7w3Tz2Crtc/r3oIZ4AzbMIz9ypgrmQXC8E1B6mmU+yvsO95k5rR4P4lwtLT33/auw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZGKnLrhfDk3q/XSfSep9ZE4o6T29PhpDxa/BKyd4I4wkmOz7X
	Q6pX1duHQ7ormeNzb7Ewl2ss5gMEpg1j1ht6FsC7RW5xDnaJ/o+5NudF+4/jxXabQg4L2BfgNDs
	cPnLYV/+32qoxfDMp47NTgsGK4crdKTRZYTbCTLezx8bxiFcms07o5VcjMM6wHP3L
X-Gm-Gg: ASbGnct5e158xMfE5qbUcwLA+GPODlQx+NkgVx94FxUJlkGbvXs74UieUJCuJo9w2A1
	HX4v7Nxk2ALzyVFRWXSjCsdv1iRKpHO6VushwOpvsH1fj9AjU0CjmlgkYrN7Q2WodfGRJJy0fye
	dZHLRcIJtBcuWRMpMlijMrDWbF4EcV63vcuk1D65az1sWm1VyIPyl6hoVVI+TzB8RXxkIApUiRT
	r0UeRhfEcnxtsF8z5uAubx1t+jq/a/+1j3Z9lGF5k/SB5T0OGaCl+iOMAFJ+w9OLdNCrUHKNJqf
	XWoOUnrXXXGcSG9wZIgd0FhNAqugPnybeLFoQyOYPE1Q6rrrBYPbnt+X2pnuljK0o9Q+jNRY5ls
	E
X-Received: by 2002:a05:6a20:3d8b:b0:243:b190:d148 with SMTP id adf61e73a8af0-243d6f02580mr19232373637.37.1756858673671;
        Tue, 02 Sep 2025 17:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFoBDXowFfmFVh9kvrykyPsnoguSqtBdlEPxuL91LPUOIVWBRu7O6kvVYOnwcBKK7zunER1w==
X-Received: by 2002:a05:6a20:3d8b:b0:243:b190:d148 with SMTP id adf61e73a8af0-243d6f02580mr19232345637.37.1756858673229;
        Tue, 02 Sep 2025 17:17:53 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772466e629asm10148491b3a.31.2025.09.02.17.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 17:17:52 -0700 (PDT)
Message-ID: <8fb26b97-f483-4155-af6b-493b2bd16442@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 17:17:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250902
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MADi2LBM81o5qTn0SZ-TyiudrLEZxpc3
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b78933 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=ETpNzpHT8A4ojKDL548A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: MADi2LBM81o5qTn0SZ-TyiudrLEZxpc3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX+OATPQoOaNv5
 a4kgYf+HpDecqRqK1k+uOSxk+o/uH6wVf93EJH8Ls3Q1Weij4q1wv3H9wixc1JUTD5YA9gWMhc4
 9XxVLGfG3Y8jQD1M0OwC2owGQv8BsRz3AmMssBgN7FrNaj2Joyd/xHJXRXUdc1MkJSy8GI8gF4M
 8cS+sAw/Mkf/GVhhk9+tu6iDq4DbwvoGG846HSPF+Z020SNxKLG/F5mnK55PHoWwYE/qTXHM77q
 tSccRCDtyTvJiDlQviY9Qz+hPmA9O/5YOywwRQ5MeU2Avw7dNH4c/KCkWc+C+BJXLVlY1nrXwsa
 vJwS279wG4t4iaeK2SRX6pHaMwLpb+2OqYqwUp+1EOggODwi7N8isSw57RkYOk04eB5KaMiD/GO
 s/rW7jr/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_171756_400362_AEF5C7E0 
X-CRM114-Status: UNSURE (   9.36  )
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

The following changes since commit 2c72c8d356db40178be558bbbd43a1d0b5bd0c27:

  Merge tag 'iwlwifi-fixes-2025-08-28' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next (2025-08-28 14:03:32 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250902

for you to fetch changes up to 97acb0259cc9cbfbd7ab689e25684f3d8ce10e26:

  wifi: ath11k: fix group data packet drops during rekey (2025-09-02 15:43:16 -0700)

----------------------------------------------------------------
ath.git update for v6.17-rc5

Fix a long-standing issue with ath11k dropping group data packets
during GTK rekey, and fix an omission in the ath12k multi-link EMLSR
support introduced in v6.16.

----------------------------------------------------------------
Rameshkumar Sundaram (1):
      wifi: ath11k: fix group data packet drops during rekey

Ramya Gnanasekar (1):
      wifi: ath12k: Set EMLSR support flag in MLO flags for EML-capable stations

 drivers/net/wireless/ath/ath11k/core.h |   2 +
 drivers/net/wireless/ath/ath11k/mac.c  | 111 ++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.c  |   1 +
 3 files changed, 105 insertions(+), 9 deletions(-)

