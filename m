Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94130FF8860
	for <ath12k@archiver.kernel.org>; Mon, 27 Apr 2026 14:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nILNB2NfkxRGoIS1fc1qp2JXSYpJLFP16z5zIuaSkNU=; b=HJD+7zgh6CubRH+7T/Xmd1toTW
	Aadb7fiSCXK1jLP4unm6bYOKd19k8+wfJMTL3G25dZ6Y8nPs7gBqBWgJ87Ee99n9ZLvKqbeBqpWro
	RhHF9zk3ZuaJqjUYNrIePCH8qRMfsxOB8krcFIhdw67AuR2aGQNBf91wbuaZdorP5Ncc2if0r5shf
	UnjmlCyC7PaOxuAdC2yx1tsM5H/fN0zMvYEdmPURdcO+Zhnje3oWWrdkYPgTc3/1ryQHRnkR0ThlY
	L1fKKFdPo9+MpLIFytMoMiTugLYKLZ4jJbcQvYb+2+A7mr3/qR0zgEF/BBCHk8kOyqID3aj/wxFFw
	uBrg5bbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMX3-0000000H2nf-1K9n;
	Mon, 27 Apr 2026 14:01:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMX0-0000000H2mp-1ppJ
	for ath12k@lists.infradead.org;
	Mon, 27 Apr 2026 14:01:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RB73281237224
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 14:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nILNB2NfkxRGoIS1fc1qp2
	JXSYpJLFP16z5zIuaSkNU=; b=H0hbbVxgLqait/8cAo16Pjys5o01mh29ilPdb2
	hdaTjtYbbpV5oZcHNe66kjrEmjf+GtxUnrUj01OSWwnk2PyVdijk4FmOLr7dqez4
	JJR/dsbLAFKDQsib0xz9VXHEBjB0x/rsCTjbtvCLBQOCUg9DyGuZKI8mo5eoEZBP
	OkAfC2OHUNcWg1qvAmPDmPNENpWCd8WqE1XemimTC4saI/nFQageBpLcb52lmQMK
	Q+o1R2gPEFJV/AmDF93umW9SUT+90KF/8FP8AaLjRTUqJJwKogZQ0A4Ou+APoUJ2
	4sU/ATNjFCE5XftvZTbhgf7E7AGWwR+ArwE32snC4UuH1+wQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4gk2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 14:01:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c726f4055so10870573c88.1
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777298508; x=1777903308; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nILNB2NfkxRGoIS1fc1qp2JXSYpJLFP16z5zIuaSkNU=;
        b=Is9Q+q+rc0T23WOcKCoyVObOx7dAw5AaMdfopRm+qJdnchAcLJ/3HM0irhL4hypkhe
         xrvUwknkUBgU8raKPsspB7znp45KV37LhD92TXCFn5LmQK/+XvfPyS2nNRDsHWHNPoIS
         PZ1H/g7ZWcHoTVF6m+hJwLHTqhPDzwjWWIRzrRhUw2o3Sh5nJQu/vi0ENPr+u7jNOedQ
         V9LD6dEHW0iXGomZMwsN01cPmK1QRnw52avErOFDHkXDyvICe8KMk51AoSXCN7oQa6RC
         SdTSP3UQxFIYdeBVKgOtc33HIuSBS7Q6jHXb8bn9SVC8tsOJ4xSBeSjr7Lwv3O8Gde8p
         OtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298508; x=1777903308;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nILNB2NfkxRGoIS1fc1qp2JXSYpJLFP16z5zIuaSkNU=;
        b=n37aY/qUK5+82asyyrVjErur8LBR5MgflHQ1zpNtG6Fd2x5sh7luo5dd9SzjSlDFbE
         7vY6UAu9OfenHo6tfAG8/WiCdn2uRjPSirAx8LeeInXV/v4tpmlwy2fUjfa0fBnJuUvp
         9eqmtOfnVR6uj7QfGOIYj0yL6cpKkjimof9SEieztgGlI5O+M/x/0TO+YAMHC1QhkXdG
         c0pRXo8v1IbIlH0RMsjS/fppaI0vKrPAhgHhNKszKO9cCzqeqNHuGLY5tndI91uAQHrv
         uJl8erVVWhcTY1LKJ8baF5PN6RUKKlC0ZEPDjKLH1ohMBZNksHJVlPBxBBOvwkhwKW4D
         UOsw==
X-Forwarded-Encrypted: i=1; AFNElJ9giIdiA1VrUzR9IxZg9bionK1NpV7KpdiTGFsSiYyg7Z8fipBTPRhrAviIWnyHtwl7sE6uOI0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwqP9qBxaNhyKa2T6U0kH83+ZvqG05U4XwTyubmQNQNYYTCh0s
	DFgi7AqTm8tup8r/6w1E1bnmM99JF9wY+XVDUqnwBObsZkuRJjWKjXdjqUyBQuw70zR+QnbnQ4m
	qv8lg7uQYCD4O/IYMW3+x+ec57TC7sMAvFAIEELtkH6ppcvLLq/QMpBmO0qtx3Il0
X-Gm-Gg: AeBDiesfpQu++vj7HfJdBTc6rfreGzd8pEQZDkCnBarEpxzomx7Xm8zzvu6m+aBw/yC
	udx7QloGWTA7LLxzvCLowqYcXPEEGr52cSFrxkFhncP8OOqfE2O1XLiRI2jvx65dAD/+kJd0R7u
	FQPBET3cN+WsbQy/HcjBjovy8Ck555uMBzxLYfpdPdnane7Qa3V8jUp/UrPkKz47ukjvPVAg2J4
	mqvUX0JSKapTIExVWcCyqLB3MndSvKX1oEkh4qEMurEWd7BJq0UpcXeFl9gxLe+n71T0Wkrd/Hb
	R//MqYcTqBvHFPfSe44AxxTEM4nLNypgE3Mg/NN7b5OX1+4S/NE65pDGPOY7GLEENnzsZ/owDjJ
	tlXlfQAYIwtUbKjnv+ryvsq7LzoIo2T8Q9CR5uEbaOB+UhDmlZrimIJo+bfLY+7jg3i5B
X-Received: by 2002:a05:7022:321:b0:12d:b654:8171 with SMTP id a92af1059eb24-12db6548357mr14649836c88.1.1777298507822;
        Mon, 27 Apr 2026 07:01:47 -0700 (PDT)
X-Received: by 2002:a05:7022:321:b0:12d:b654:8171 with SMTP id a92af1059eb24-12db6548357mr14649716c88.1.1777298505647;
        Mon, 27 Apr 2026 07:01:45 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc6f08eaesm19806512c88.12.2026.04.27.07.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:01:44 -0700 (PDT)
Message-ID: <411dfb79-9449-4c7c-af0e-d9d1dc81f3c6@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 07:01:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260427
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eoSXXr80v_cBQvVy-A9uv90wxz-0Tetm
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69ef6c4d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=9dYn0W3-_-pxAYNLL-kA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: eoSXXr80v_cBQvVy-A9uv90wxz-0Tetm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0OSBTYWx0ZWRfX9NQzz8F4iZDu
 mKvkTKuyF2nxSjEdr00MWMutpsPj+vvgIZMWbsVMX7W4whTStQP/PQ3kBOPHgdiD9NqcgmsSusZ
 9ZE++6+RGnokaBjgybbDIXmK/+99u9mpN6ShMGW1aEKJNvesPy2mkQNAlcYwfMojMQAJraiLlZp
 6PxaRYF5Fkj7SjBSHV+e7fNpqB7LRu5RD7TI4i1FyKOG9MSYdIeYMUWh1yb8XXnXN3NmBilmJDn
 kJaOKX/pxN5flsSpFiA1P8SgQLlLQEf5nrrLsJQzy4w8hO5b/hURpn90FIK6lFIfiYEV6yaXEw6
 qv6S1l63By+mKH6X1+WpWLOjhv3/1ZzZiz4ofVHuhp3bDUDEIAo8q2ai98CMCEN3afj79/6Xyru
 pa5jjOozHBBpf9kVCjcp1jES9Wa5Zh9lB3i7GZ9ozeO+k1vu/EaikvplDoJIcRWkBDNZkd/UaYp
 ilGIFog9wl7HYx+s6GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_070150_639026_60C4D902 
X-CRM114-Status: UNSURE (   7.88  )
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

The following changes since commit 1f5ffc672165ff851063a5fd044b727ab2517ae3:

  Fix mismerge of the arm64 / timer-core interrupt handling changes (2026-04-14 23:03:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260427

for you to fetch changes up to 4498664e2d5888efabb96428196a926acdaa25ed:

  wifi: ath12k: use lockdep_assert_in_rcu_read_lock() for RCU assertions (2026-04-23 10:57:50 -0700)

----------------------------------------------------------------
ath.git update for v7.1-rc2

Fix an ath10k build dependency issue along with a few ath12k bugs.

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: fix OF node refcount imbalance in WSI graph traversal

Baochen Qiang (1):
      wifi: ath12k: prepare REO update element only for primary link

Dmitry Baryshkov (1):
      wifi: ath10k: snoc: select POWER_SEQUENCING

Yu-Hsiang Tseng (1):
      wifi: ath12k: use lockdep_assert_in_rcu_read_lock() for RCU assertions

 drivers/net/wireless/ath/ath10k/Kconfig |  1 +
 drivers/net/wireless/ath/ath12k/core.c  | 77 ++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath12k/dp_rx.c |  3 ++
 drivers/net/wireless/ath/ath12k/mac.c   |  2 +-
 drivers/net/wireless/ath/ath12k/p2p.c   |  2 +-
 5 files changed, 54 insertions(+), 31 deletions(-)

