Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127D3F8FA84
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DWPUc7al7seOtzF17+ZKNAmhSS/cjwEU4vt4ddqzkso=; b=BvEheh8M6lOMknkeL8LiExQ9cK
	nXVQGb/VXdHwGvlc9ucbhgDXRHEUQkWGLqmsnIEME98pFb1BQnQvy9N0WwPab+EdmMibdthIdlxMb
	SnMs9Ubyc+OFYzWjTgULEfyE/TSMjIPMMN3MYg9m7ze/iT8qJSQGD+vTXd8QZ9OHtxomlBpXpjo1r
	VDVdghEjtRCpbiAzkhnb2aJby13tXO9Fo8xxKttvD5n6YpFgkJQQzR07OoN/CM3IKRzT9vW/EbtYh
	48Hf4DvF1HBI9Tz9bY1+H1vlGtpcKdBOGHMPdM1g4D7k4IM7CinsMlJypnoiK/yak1bek33fp5iW4
	JljqHibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCD1-00000008kGS-1Vrb;
	Tue, 21 Apr 2026 14:36:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCCy-00000008kEz-3xSp
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 14:36:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCsQLE3574133
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 14:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DWPUc7al7seOtzF17+ZKNA
	mhSS/cjwEU4vt4ddqzkso=; b=iy++ZPrIOWmSzp9tyjXuKOP9e9KyDuuQpabMo1
	faj2cCewDGJeXhJ1+d5zhIyQw++CZDzl7A0VX6o8zpbw6pbjAD1o2BoCN2NxrGMJ
	37GvrFTiVLJeBjujIlT4UFCXgbc8vBbM5Ogp9muEds/6z4BtvfKJ3XSnPtgbWu6A
	LGzzFlfMW2uPHMbo+PWFqnYPejNTyDbgL2pz88GrOGmIuVKFdG9kjzXYFslQ4bXl
	w7VzJsczcpj0RLYIs2BG3AQXdfMMkPg8KiidoCNTUngOpFaQSma6I2JiYfGTsGzO
	aL8turnswMAap/7zX8qHTzT7qlbDPcLm2cFoKRH9TcNGJGVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465hr04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 14:36:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso5136632eec.0
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776782172; x=1777386972; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWPUc7al7seOtzF17+ZKNAmhSS/cjwEU4vt4ddqzkso=;
        b=Nhy1xnHy/idVp5NxmiW1WIzxoSUxKUF/lxj/4Ie1dzGwH5BBp31VAcSh6rXw+7krc3
         pdbkvu6YH4VRcchOjgkQctfrHL6JpjL+2sFuJor8ofit5GOMD47LWawU0Otvoij2m/J7
         ttV9z2oNewUhpctnUCq0bIBM8Yu6cK95Rtk0G3+vZ0dHg/BDidSKFwQqFrfWoIZUbVHz
         h33d8GFDn8/HtQifPkGLXwVf0XKJkhNi0sQ2qAV9pHLwUISRKk6tdVyTiIq92kRgilf5
         GdiYRf8NBwuarS/roBMu99T5AvGnkGo0UStRfwnT+3rrSPlPJj7nRJU76Sj3sRJa31tn
         aV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776782172; x=1777386972;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWPUc7al7seOtzF17+ZKNAmhSS/cjwEU4vt4ddqzkso=;
        b=UDDJ18a8P425lnVaOW97PlhB0NIiJhf/0k7kTOZ0INJ0LY91hzZO2BYbVPplpjxKps
         6HI1o32ZK4WueJ6pPUm4s4x/BCdNQL76JvCRcJldTtKMx+MJMYixX3NtZGj7aHf6vwaR
         U4kKdczrXSwrwrC1PqDsjKNTScXwpCw156BrMLUjsESWSY1WmsCTiIy2/tlotV1jQekt
         TKrR8i6nC8UC7Zu9ocJe582UBp0//+tn4Rrb6cBt3SGK2iiY4ijyg5xtQcEX/6H0nyjF
         q9baocRT4KFZDmgRZBQad27u7k4FC/B9aDLT2YViif5I6I0pe540FXs0ggADtH4W0du5
         qnXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Aiik3zt0nV1h3RD4Pp+EdynQiM2lYLAGrEPbzcH002BbpmpjpFinWTx6+wgDK23heoJ9JlI8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYrG0Ils6Wfyi9JUNEwvz3NBOgpj9eYvG93vjhzbMttstczy3F
	pOphW2V6wDvzGTImpN6lomkKLIzMk6VDDxdr4xhscqdPrQf9QeLH0wgnl+xdJPy0uR5GhR0ZIl0
	5Lm9jQvJsOpNVse02uxJ4QRcrML9AxaXRmSxSa1hV0WrZc7ejhwLGIbevWkbHKMnf
X-Gm-Gg: AeBDieuKTxmSJi58xssmrZh7UYWO2QhroUHTZisV+xPFbB+ADdlZG9PKJmHVNxgDmNQ
	6MzNuSNZLEzuNXEOItVwT0W73IgLKJowtpPAdBTDUH8sn2X/ZptuCtN56ldDYvoipieZl+OKH2F
	aciGFa93LbyJBx/sqe7x18HXuXdSFpNkT40Mv+QmjDVj5C6sEfcchb5/C2xyiXpcBkXBIvANRuk
	6mj7RwmQLVOwg5TqgjgdxsxeJW36A0YZhSWFRDwcZPUd04nsa9JbPcmE3tIOrE24R6KE0gBV/b1
	hsHYzv97U2Z2ewGuyE5dWHVcAvzMmWoZaeQpbke8qE+WCTwhxFvak3zIOtwtYuwiN5rJA5FILqc
	xxtZwHEavir8tmPxY5yfADs+bMgp/dBbFaUmEpS+Las6/ixGwPdZ0FdFkQncJOMqNdIcL
X-Received: by 2002:a05:7301:4704:b0:2e6:e77d:7bcf with SMTP id 5a478bee46e88-2e6e77d7e0fmr4635757eec.22.1776782171436;
        Tue, 21 Apr 2026 07:36:11 -0700 (PDT)
X-Received: by 2002:a05:7301:4704:b0:2e6:e77d:7bcf with SMTP id 5a478bee46e88-2e6e77d7e0fmr4635728eec.22.1776782170740;
        Tue, 21 Apr 2026 07:36:10 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm28627176c88.10.2026.04.21.07.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 07:36:10 -0700 (PDT)
Message-ID: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 07:36:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260421
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE0NSBTYWx0ZWRfX3KwIkzfCupen
 9kd3t7+MBf8NwuZk1lmdknM2k7vRh4EqsUgM+PY/VhpKlhtUzS//8beg8KiSJAlWpM2nVHMPtpm
 nReKubZUrBdrAuNan7UXchZk0N84rX6JJbBO2yiNKzQ14Xurb0CDnLoT137BRh4A7gvWmYLiuz2
 w1Lcbt1hFb27PydQ1/lrFoApRh7+ua5+LgBK9j9b8z9tJp0mAOkZaTU7AB3/fCle0LRMi3OMoH+
 Lyl7/doAkocIkNpmRYifmRgK/bPn52oaRh6QB8Dv7UXqJjuh3w26owCWYR0ed+ML3x/N6/ZOMt2
 vIA1h1Q6wSYnSJX9y5ZvD9p5Fq3TLYtu4hRwjEkcOZf3fVq/m3rHYZiO3mnEXpsQoQZOS4su5ip
 tWUxOnf+qq89ZJ1shh0LdzGzi3xVuZX3KFmbSbdviZD8/9qWHPOoF6BsCHVLo/R2bdTEwz9BP3o
 YjrevB6G7ngEB64LzQA==
X-Proofpoint-ORIG-GUID: 0YDaREC6usLRJooPeSgA35BrkY9QRpS2
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e78b5c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Ulex03xzRqfrDqNhIRAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 0YDaREC6usLRJooPeSgA35BrkY9QRpS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_073613_003009_C9460326 
X-CRM114-Status: GOOD (  11.57  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath11k.
For ath12k, add the initial firmware and board files for IPQ5424 and QCC2072.

Please let me know if there are any problems.

Thanks,
/jeff
---

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

  Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260421

for you to fetch changes up to 5bd6cbb6ae899e81c1ac3f6915af05e26a354b51:

  ath12k: QCC2072 hw1.0: add to WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1 (2026-04-21 07:06:36 -0700)

----------------------------------------------------------------
Jeff Johnson (4):
      ath12k: IPQ5424 hw1.0: add board-2.bin
      ath12k: IPQ5424 hw1.0: add to WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
      ath12k: QCC2072 hw1.0: add board-2.bin
      ath12k: QCC2072 hw1.0: add to WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

 WHENCE                               |   11 +
 ath12k/IPQ5424/hw1.0/Notice.txt      | 3987 ++++++++++++++++++++++++++++++++++
 ath12k/IPQ5424/hw1.0/board-2.bin     |  Bin 0 -> 353740 bytes
 ath12k/IPQ5424/hw1.0/iu_fw.mbn       |  Bin 0 -> 348152 bytes
 ath12k/IPQ5424/hw1.0/q6_fw0.mbn      |  Bin 0 -> 878224 bytes
 ath12k/IPQ5424/hw1.0/q6_fw1.mbn      |  Bin 0 -> 5623872 bytes
 ath12k/IPQ5424/hw1.0/qdsp6sw_dtb.mbn |  Bin 0 -> 20404 bytes
 ath12k/QCC2072/hw1.0/Notice.txt      | 3386 +++++++++++++++++++++++++++++
 ath12k/QCC2072/hw1.0/board-2.bin     |  Bin 0 -> 401232 bytes
 ath12k/QCC2072/hw1.0/firmware-2.bin  |  Bin 0 -> 7111860 bytes
 10 files changed, 7384 insertions(+)
 create mode 100644 ath12k/IPQ5424/hw1.0/Notice.txt
 create mode 100644 ath12k/IPQ5424/hw1.0/board-2.bin
 create mode 100644 ath12k/IPQ5424/hw1.0/iu_fw.mbn
 create mode 100644 ath12k/IPQ5424/hw1.0/q6_fw0.mbn
 create mode 100644 ath12k/IPQ5424/hw1.0/q6_fw1.mbn
 create mode 100644 ath12k/IPQ5424/hw1.0/qdsp6sw_dtb.mbn
 create mode 100644 ath12k/QCC2072/hw1.0/Notice.txt
 create mode 100644 ath12k/QCC2072/hw1.0/board-2.bin
 create mode 100644 ath12k/QCC2072/hw1.0/firmware-2.bin

