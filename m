Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD68A109C04F
	for <ath12k@archiver.kernel.org>; Wed, 25 Mar 2026 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=; b=s/DVtHWZF/CcRi71RnlmMKX4o2
	yRQwknJQRUHhfiha17CO0JsnSNu8udQgmXbH4Lnpkc91lLBFbhGZfeYbWpHVfh7tReBc3bdzeUfyw
	bJ91kKWBcxwcjnQEAaW96DR3G6pYMW+1JlpyOESa4HmvzzKhHkC5eIbYZuSlDWj17EGI9cMqU8kMT
	ezzrp6+DFkT3fF1wtxsdn/rR8o6E8F2x1mUA9Pj8x7SNg2wlJX7zZ0Ge9KipdneA/hkghTZIp7SDt
	xdatrAWUboq1i5HgSdGAv1AGGb+3RLNQkVkGCeQDDMhhXU6BbsCXo7i+ikRiNxcqv9idp/vvgJN/h
	SNwd4Lyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SWZ-000000041zf-13iS;
	Wed, 25 Mar 2026 18:00:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SWW-000000041yN-3jUL
	for ath12k@lists.infradead.org;
	Wed, 25 Mar 2026 18:00:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFRLtg1432159
	for <ath12k@lists.infradead.org>; Wed, 25 Mar 2026 18:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M2igQvo0xuhoDdesLA15tF
	kb4vPga0Hsxbg78nCkoEo=; b=Qbv5X0HbVUZz+vewgHuF9ZN8NA/EpeX/qykEMP
	nf07y7SUKqHGQKCiXfclA2j2MIo4SNlLok57ay7OwRmTa+XB1p2oXh2WyKnpSVxp
	bGvAl9kYl2Ou+U/BgZEk5ZZ0160XEAa2bGL7vsXHEwsV6fCe5v88flhlnUD/1Urt
	qE4cI270bk9H1lPbYuasIVtfS1HdcrT/0wYAWOYpfoP+qrZou3p+h5Q8+oPDHL4l
	syoCRgv0x9FxzyQ/tod31mWf0iwn8CY9XlzQ+cV+YFO4Kauc5wmPFwgl/Lw52aY2
	gcN5eoyfgU6Q4sKA1hXGuijWiQPcwe986ydsQQzr1w3TgdpQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc50kpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Mar 2026 18:00:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so134898eec.1
        for <ath12k@lists.infradead.org>; Wed, 25 Mar 2026 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774461607; x=1775066407; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=;
        b=Ex1n1UHfHvUiCRx9opk5Psw4CB+raX77MZE8STPppfVaaIPc5NbBwA+Q+SLfcQlkct
         LjksjSlpXHL/AC4zwTDq1HC1BJ+LtVrQcJPZN7SYk7Zt1VJitKMNMuvEriW0dbXRU+j9
         thuiCKrfmY1Lnw2QBqva/PblqMnskltjzjtfhBpAExP7AWdQ/ecKRgv2ZGZLZGVXNev+
         nHWQVUhLQoubwktFGN/vKhdT/whbQPEmUU7aesWRFh83Jo5zNhq5W85mAY/hIXsmZfHO
         kTeaP4Q7Sb1Yx2J8yxeDrS36NvRr+SMJtaRnBhC5uxdNxn1lR0gd1ViX9bgbI5E//IME
         gsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774461607; x=1775066407;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=;
        b=WVbF5hWcor2Ybuf/Y4xQ2jMhbBJ6vQIFyoCl0j7wbkjrEG8GMrjM8D15VdMiQy/HHN
         Bwl7V31jUMZC5mi15Fierbs0LNZP1Jlhb1F1HSebwbN3bFWdRXWAC7dnODZXgWIQs2sr
         29IZiZqQmohklIx/J4Rud0eDhx+j47i1Y0/s2VoFWliVoD3GKlclOy61gt4Bx9CzO8te
         Oeb1oWKEr71hyt8krPHJLIgPkhQNpE7P5dKpFycDAC9kqFxC/ttNJE/Gaqocg5scQCbg
         utwpSBInhJeYTfQaDui/8464HUBGrmtcZ8EhQ9Qvn6GNaoajb2votOKMfRl9uYn9gV06
         O94Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvraYvfOeBPSVOZu19TMh2a7Rc8Vy000wbTddy51UVS7vNQXdCfvkCmIFNfpz1it8T73zbk90=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1/3yTmsTE8FrciXaNJgBhZ2jKH30zqUL1+saI+ACNQuGbhgJr
	5RzBnc8GX81HBuWw6Cfji9MkAxLqre4xM66uuB4NkMsQNec4n155l34Z4TmHz3XAwS4oqAvu4WV
	rcPatfvS5L91Yz/qs8+JgzEqjBGfM4vmBMmh6mvpjRBSngHInklK97pkhUSXj9FIF
X-Gm-Gg: ATEYQzwkSN9wYu+c9BONf2MrKj0jvuLe7HL3RVScU/UlmF88Q8FJCEyAZntcNG16Y4D
	B33IJNYD0jTKiRvHa7ec/yPCJAvwEaScVKNmAYg7PXRS1p2M0z+tPlBs7BPjQpIekqDzFALL6fm
	WyzrkU1Co1HlEEgPUGLZGF9blQQyKt+898qWcQRQ+jGXbgjTi5H5Q3LustIV7fvBG3TX4JCs/Zn
	TTknoyWGH7bIpJZ4d6YD4Hih5zM8OFhtZXgI6RA7WtzHW/G1srU+dfGgPcXcP92YwTrOlw3TX5Y
	4BX30vXVRyuy/jdXAFharPlxDTGBtRsRZqikxm4RIIEZkeqLQJpIdGDjVWaPCoKVBZnVfwHAC+z
	11HH+iWPjvTJJCmN7qMuhRisvIuIFbbMgZmfAw8sDoiSq0D7FeTvx6jcXmA==
X-Received: by 2002:a05:7301:e22:b0:2c0:c152:ecc7 with SMTP id 5a478bee46e88-2c15d3568d5mr2650440eec.16.1774461606768;
        Wed, 25 Mar 2026 11:00:06 -0700 (PDT)
X-Received: by 2002:a05:7301:e22:b0:2c0:c152:ecc7 with SMTP id 5a478bee46e88-2c15d3568d5mr2650432eec.16.1774461606183;
        Wed, 25 Mar 2026 11:00:06 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec2690bsm428056eec.5.2026.03.25.11.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 11:00:05 -0700 (PDT)
Message-ID: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:00:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260325
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c1uhxnRbSh7wNya6BN2_slnlbXTngP3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEzMCBTYWx0ZWRfX2mItEHSbCP23
 Zx+Mtz+l2neVDCAvf0De908CE2CZrnvtkWd78cJgSZov2+xf8He+cY3PZ223pj7+44v7thxxdsH
 oclHZTzwzRdDVIl3zmMv+GHzyQzY0rf2SF2WFplv51tcmtSp0Bae6g1mPygQxbrGvxUj5Po9y02
 ZYhtfrEXOvtGOxcyjxSeac6rbxUs+rZwnKHvl+JqBFMbJ6DgWmmuWp5rTi2UXHF5Fdk6HB+cS35
 2n+KSExvMzLz6Rg1PLbJFoxcnlCk07hD3NZInDPXd3pxmzJmdR6h8jl2dxKZYfa+V4ta/wc7OXe
 GJwh5UrC9BsRXvY+n+lKzkRVpOl/ua2lKbXikWwlL8Zf5bcdXz+pVh8DqEwU9+rgqukaRgzy6qb
 mddq32+89hTF0UqozYoYhGJ3w7oOouX4kG6Safjtp7QwnIvF4fgdazQmY5kievDfA7rK4XSMeTr
 vn84GAoSSaYjLFq14Vg==
X-Proofpoint-ORIG-GUID: c1uhxnRbSh7wNya6BN2_slnlbXTngP3H
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c422a7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=6dYnDcIryfdnK3l1ooUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_110009_059608_3A8CB38F 
X-CRM114-Status: GOOD (  11.70  )
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

The following changes since commit 51d2775ba036b0dfbfe44c7ba0a1350ddaefc058:

  Merge branch 'qat_4xxx' into 'main' (2026-03-23 21:17:08 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260325

for you to fetch changes up to b56c03b621391558627e3aafe5a8dc32d3997680:

  ath11k: WCN6855 hw2.0@nfa765: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2026-03-25 10:53:18 -0700)

----------------------------------------------------------------
Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k or ath12k

For ath11k:
Update QCA6698AQ and WCN6855 firmware to address a WoW page fault issue.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
      ath11k: WCN6855 hw2.0@nfa765: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

 WHENCE                               |   4 ++--
 ath11k/QCA6698AQ/hw2.1/amss.bin      | Bin 5083136 -> 5079040 bytes
 ath11k/WCN6855/hw2.0/nfa765/amss.bin | Bin 5005312 -> 5079040 bytes
 ath11k/WCN6855/hw2.0/nfa765/m3.bin   | Bin 266684 -> 266684 bytes
 4 files changed, 2 insertions(+), 2 deletions(-)

