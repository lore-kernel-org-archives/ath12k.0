Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF32C88E53
	for <ath12k@archiver.kernel.org>; Fri, 11 Sep 2026 22:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=; b=Ua3HcNw5d7IP+PZMB9At5UknG1
	n6vxMXrppEG21ZSJW3hcCzZ8ShOKl6U2AY1uha0KSmqjCVDknsFDkP80svIQB/tmZglfzXeI6WQo/
	mz/hCeikuHHb1KKUh2PDCv3WVho6DSHAvJexXOT7u6Hzez1o5Pl45e92v7hoccp6eCaCIrRfi7+JY
	TiKTpXuuyIYDBgbAw0FxjG2tclJHRA6/zclgjzXCoLbbY9UwAziO/bmAZzpVp45Q333DHyVxpDjpf
	YfhY51BQVSqnDNbeTl/1gPx5NvmX7xUTA+yklF10eeFYKoUiH+gvMSFbroy7JTZyZDCBmSyOq4lgf
	h5si5zDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Um-00000000Eju-0KW6;
	Fri, 11 Sep 2026 22:13:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Uj-00000000Eia-2Ug6
	for ath12k@lists.infradead.org;
	Fri, 11 Sep 2026 22:13:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWaWr4119363
	for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 22:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JYwTxVAwAAEy9xr61JO4H6
	DlThANBCiqbXJNrMjjvpc=; b=GRUeFQm6/+FKi+X3HvnS+qPpR1BJ3t5z+FbdVZ
	AKOn/eTE65GbCG2TRYO8myNf6T+DUPZSKP/F3g23x4Kg3JuDyFVEssqfOqgLuJIf
	mjIn/J+ZLc3nTVeJ7fDzD86NswFg2uIQiao1LuletsNewFYheXRGZSXrn7ZKZpLY
	65mlirpqrnoWxIZpBsBarJB3IM3g+ok3daIDfaa1apwCPo/d2brt5c43zDes64uW
	vFcGhKxHYCOyUlBzgFM1bVHSoXO8rG1VrRCCcCDD671ozhz1UgaVAaPPjCh616pV
	JWATxbaCPTqf1GmUy+LMyxpOY7lYSxKmvG6BzXPUAyFeHfzw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmnkms3wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 22:13:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso2330652a91.2
        for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 15:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789164796; x=1789769596; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=;
        b=I7BRJb+tve2pQFLWAG07DiMwQZLiTo8mFTieuUYWXF7gRCQDEeZaOAH+SFNPuwMAC7
         L72KyqQAUdJ4HR/4QE8NrQSUUUYKPjhVKaNexvn61jl84wAPSfCxrkWdNzU9ETyLsS2T
         isQ3h8EEM7mi9qLkyGoT2VC4ytWDMPEhRkKnQkg1WvJGFYf5FmN2VSbDC3hnXkE7vV6N
         XAIRrZUG0yl7zRnE8b2XzOT07gRGA4lmEYQJgEE+0GJT5c6pdam3U7kbIucsyrfaE+bn
         7NidtudhgXHN6/wl+rFcvhIhVF7ATZMZGT5GP9ItFOagx5R7+AYtSrGZ+6IGT0JbznB8
         GWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164796; x=1789769596;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=;
        b=ceHVoEqgYysGF9rH8cLfipqeTJwAzc6wqllx1dl7LpviQBuhR69aWVixo//W9WNqu4
         lfIfk4aH/AVd/XbYdS64xa+2vMZ85S/T1I5xVdiTiXXdB6vG/vDCliEwHMl2JYxfworM
         h2096s6ytMjcUD+mZlEETTIkx+rxXMKD308KXQEgrGawXCBA2+QF/Iw4y5Uchq7DG4Mo
         YtopFdwTG7VcxmmFSXmW4n5UEts8ryf9v0rcZ19IT8ucmjSOnyIl6moT2K7PteTTJCBc
         X3dM35lOqUnxNJpMgrwEBqLi0gKITsY346nN0jvgJ3BF+NvTn81Kro69fzglbBh71dSs
         O6Tg==
X-Forwarded-Encrypted: i=1; AKwUvBwQQMfxyvK8Zw7wODPg/nw+KIaD3v0uWXCnjY0wYJvNfPw5bNxKFo4qYDR7YXGfkGMB/u++c70=@lists.infradead.org
X-Gm-Message-State: AFuF++n11rqjxDGtU2adaAXhB8yHc/nVJo9Qk5OsNx8bif2yhjsP6/OE
	vVvyt1r8YV0WWtwVOaNeTb41CoPly1QKYVNGEdLEsuxWJqvX0lsMhqBwj9WVakiA9B5tb6CNPtD
	hkeqD9Q6cQQTValfcJLtdb0WMH8+z0aIESj21f/CnPqXOU8z8L03HSwQIt3HiuNcJyFMfjpOy
X-Gm-Gg: AYBFou2mcCotMqOSTWTuB80VqsmSvT2y8guPG5Tc02ueasXM9qQg/yvDJYcETNuURpF
	gCWMw3b2IQKepHzqq+M0WCy2m00DJCWCbT35AWhBu7bwhE17J3hQwEnexpbH4QYoPdOQoPfUxfF
	PT0VUdmKk1jbyXaHWhTq7daKeWKPNyn4mhtlgN+0WWaw0HxZPIR3yj3GE/ImUK9RD026px7BcYM
	D410TcVlFOI8yHx2Q/HgeI1iXKNx+AgrbpQO6I3Gow5hmjspvAlRuNbe42XWDSS5oAfztBXI99W
	eHhLIR8w6cxzoD/wBnwBS8Td3IqJzE9FM1KOonw+7n4PbGUSRwKIcIWKyr6+pFPXyhJpwXGL9Lc
	5zAC5TOjakIqMEwguZuZuL9j31H3vzKcKLO3q
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr352757a91.23.1789164796332;
        Fri, 11 Sep 2026 15:13:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr352694a91.23.1789164795793;
        Fri, 11 Sep 2026 15:13:15 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm10137893eec.17.2026.09.11.15.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 15:13:15 -0700 (PDT)
Message-ID: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 15:13:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260909
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMxNSBTYWx0ZWRfX4lIVBagk77j3
 2OBkEVgrt0QaNEx+5JS8N5dI/Oopplw7XzQW29F4KyHmIR8Vu66dNHgeGjbvEsNOHj7BXY5zuiE
 kgqA09L3ABMlSyBiCNkvoQVEA0sRB7E=
X-Proofpoint-GUID: 76v1ytYWxx4SyUUyB0aa2IcakkF-1mWq
X-Authority-Analysis: v=2.4 cv=N/C8hG9B c=1 sm=1 tr=0 ts=6aa47cfd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=rlMSw0Raz3rYzQdK8EQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 76v1ytYWxx4SyUUyB0aa2IcakkF-1mWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMxNSBTYWx0ZWRfX8s/IRsgQUM1X
 rg6G1DGyEFlUqshBSxbiImmX5COmDdgPk3M1NiUDb5ce9d9LQcZe0bjhicjI91psLJWC3bheTYi
 PqRRIzFuFUZSIZVU2mCkfxqieWG6x43D+bLcD/9qPOUP4Z1J/Uda8MVaTx9KZKm9ot5/rlGkebc
 2/vBxTMWv/SL4Sl18A6vaIuqIcO53OirhXJwKUJIR/XvfJi3cKf6TyuVXb+EyOnuSGB4CV5p3Nh
 oJW9sPJ9o4/Q+fokLRYplm9hGRA7K69KKYuT8UaFrRzyjRIjXSUFobHdHJS0Gp/+7D/L2P2nx8v
 F6VDB7+hMkgdWGEOw7QWvcId0WOSXzSx60xb1J4JpfmGRc9/QBTJvbZR492takI+vol5WUJv4ph
 6mmxH0isV5IkLPvO12tZwZwycEGIBxWksOkmRVy93L/GNKEfGgij1hqr7FWZ/Xrnm4r3FkKGRG1
 Ucr84sh/ljHlIun7ubw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151317_642433_538124A2 
X-CRM114-Status: GOOD (  11.23  )
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

There are no changes for ath11k or ath12k.
For ath10k add firmware files for the shikra platform using WCN3990.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

  Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260909

for you to fetch changes up to 46c028dc5c8e8a75c70987b9b4388ab6133d1012:

  ath10k: WCN3990: hw1.0: add shikra firmware files (2026-09-09 09:52:41 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: add shikra firmware files

 WHENCE                                          |   4 +
 ath10k/WCN3990/hw1.0/shikra/firmware-5.bin      | Bin 0 -> 60 bytes
 ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp | 571 ++++++++++++++++++++++++
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn        | Bin 0 -> 3811820 bytes
 4 files changed, 575 insertions(+)
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/firmware-5.bin
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn

