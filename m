Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8F8E9D419
	for <ath12k@archiver.kernel.org>; Wed,  4 Feb 2026 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8opFdOz/tc1NxrXdMT7CER6PwqQ8gtJ2RmFX8c40zGk=; b=1epRQsqDtmmySXwsIWuRXopGZZ
	a+zy/tvNWJ/D+dbLYvhHYrbgMkLF5HKBwU7/Uine6ZYer0VcGh8XmuyGMmK/17C3kW4d9oUfjBwRI
	x56IYsYKlWGdMtcMT/RngbOYIDU0VyhULWSBGpbYN5MHWeQJ0HpIBhGWOJ1PXsE24KGFm56aPaFvg
	A+EcfkjmjZeUTUNg2xHxjaVWrkNGm/V7YKgv5xDqk0JZ0vMu/aF+4HT1RYU0PpXXGKrP+9/AMjgJo
	ThmsyIb/2qJ0kHmjEZz1EdnMWZKaGW6RZKayoVU5LxnB9qSA8EEE4My1CmO6ffT6eeyPBdXKrefpX
	W64N0dIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngW2-00000008qBV-269i;
	Wed, 04 Feb 2026 17:18:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngVz-00000008qA9-3Dsm
	for ath12k@lists.infradead.org;
	Wed, 04 Feb 2026 17:18:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIeD5096287
	for <ath12k@lists.infradead.org>; Wed, 4 Feb 2026 17:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8opFdOz/tc1NxrXdMT7CER
	6PwqQ8gtJ2RmFX8c40zGk=; b=Ks9sF/V2fez3S/ZVEalIMMMix3TE4RWWsl4hye
	GeRpXhA27IIxmC/RPeaKrw7r6YctIzFMAE5/LAgIjksA4fEBinvshUEW3pknapMi
	08NQU4AyK8pfePH4ICxyQ7UmoQws5BbeQ2oHqY8/jm7ZxWyKRPXd9t7sFjjcKSz0
	v9sP6d+cvEfedSYM8cqFwK8Bnvr7rsmcZXw47eU9ou3jHdHeegnS8i9qMG/CBdnc
	Q+bh6H2jL67g38xbdPJzjw2VZLCrhVqmWMPVmGRSXcU1whLN2IHmw6gPXJWj8LgB
	hSNQmq2IhU4AmFKg6UwakbVY+BHYDASfg5+sHQIP32HWSNsw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44kbh7g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Feb 2026 17:18:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b8343aa8a9so1088716eec.1
        for <ath12k@lists.infradead.org>; Wed, 04 Feb 2026 09:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770225486; x=1770830286; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8opFdOz/tc1NxrXdMT7CER6PwqQ8gtJ2RmFX8c40zGk=;
        b=X9+uAS13cEPBoI7+hsP0EemMxA7sw4r+5m7AA7FGZyQxbNeGt0lwSxIcnDD3GoZqaE
         1fcLfM+NsJb3Gr9PRxyxe918uc5ls1F/ZemuApIYxvZ6YDBMy2ndm6fqz41yQ9k6pCcR
         mjcygf5ccHf3fLlAir5tg+0KImTYtos51wy/0QIj+bCvszkOanTFfKByOmb4vsIgeFjk
         /IPutoFTkNYgqQQ8xEHHnt/SPLuh+D7CSX8KLflSnur6uPwmPKBDPe9EzvYy6Mjj5SWx
         6C0h1ZPWOG7cM/QJQDN5RGxoF0xUvNI2tqTXkdsgAF7eqk0Zget1luNpa3JUEThB5/ee
         M6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770225486; x=1770830286;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8opFdOz/tc1NxrXdMT7CER6PwqQ8gtJ2RmFX8c40zGk=;
        b=KEBZmSiwUyI5DCTbWTTSYgLJ2g7RfZAEjJW6lqrcKfAZ3+gL6bzNNmN6ve+QIX2Isq
         i0QsZ8xYapWOs+dmhcCv4HLmTlrju+KCCfMx8wKcLXozyLjxDC3mA8YRLz0QJNNjyiPC
         GxP53nwVQ0Rt7zTk8/0ziRE4f+4zerMAErNsAyNlRC37zQ0/i6Iai8JvxQOIFsShGGMx
         guNzL1ph7RSM2D59cSu9KlErQh8KhR00N1kf7eMiurHcs1EdhUMEBec5YVBlUZGN7OOq
         mbsHoipnh4Q6m8Qe7qwz7SiYr1m0iQ6e8s9Wofh0zmuIN67EvSopJGg2TwQJXLqjBSeZ
         NdAA==
X-Forwarded-Encrypted: i=1; AJvYcCVKiThZtIk9c/UkGXbl4JjWeZKl2ex5gJGDL3YvPPoOnExJQqqxZf/YpqxNwnlt9EG7ts3mJjg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFMmrbmPGmRZD9xN/0fF7InRXJWtgo1E1PYytXQoPJ+ZRDAfl
	Qdqs08WsRku/hsuzQUWZvo1j7Uonqi6rAJyWVVEIw8H1x5QHX8UtCN3xUH+DrxdggoZ5P2Sa8J5
	+zyb7FBj2OonH1yM5P+nPOGxvJ3wXGgDzbz7lcU6BpVVRf+AfeakC4My4emhecnZ8
X-Gm-Gg: AZuq6aLiFl3Zh1mNE6703faqvL1rQI7SgOeY9/DNUhtvOQiWPdk938Oz9BmbkK6Rpdv
	LY8q/8RZF5RuBdC4HrJtcchqa0npA3qRuy79MlOsMmb9MQDA5DoSQ8AkTCdvwXTYA/23lEU65c1
	e50i90/I/msYRorvzgY+/E/j4asiKPH8dP7jyaOpJfa4vCCMFatf8gZb+XMJpWPJEPGt7Psm4iZ
	+ZL1sXu9v3TcE1JJCv7F+8nFVseRclZJ7Gpcb2FEYC1ARnnJmkMERDSRdKTYRQg5khqHSL1yEcM
	XYAiV3k9TmmwIvUPUirELvQvEkOHUmHbedlOKUr+iPbzezrAVQ2ql+scl1Cgdxh9Soze2ptOLKT
	PHOp/3HrBmNNjGVY5j+YK/vfgEkiW5zP8DXaMKzDy1zOPcQ==
X-Received: by 2002:a05:7301:1008:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b832919b37mr1535422eec.12.1770225485601;
        Wed, 04 Feb 2026 09:18:05 -0800 (PST)
X-Received: by 2002:a05:7301:1008:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b832919b37mr1535405eec.12.1770225485029;
        Wed, 04 Feb 2026 09:18:05 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f5030e22sm2490537c88.10.2026.02.04.09.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:18:04 -0800 (PST)
Message-ID: <18adf454-8e66-4b3c-a6a9-81faa2c57602@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 09:18:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260204
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I3-37l4wtFpLbrqhe6q6Jo5UmesgWYSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzMiBTYWx0ZWRfX4OeYDGSK+Xpc
 SkLF531GnXCINVfuXYT9aSzjLTPN4TZMMEeWDjX0/NKC6FUQCsj5i0UVm2j0eVyZNCk5+kRo4kl
 UywRyoUPgKPepDX6zjqsuPHNBmeBPCw9NDOeLJv4X2sI/0eoe5zS1evIoBzKHnpVCeDmE/VFTRK
 2iTKm1/l+ulCqRpSoRBBIgTj49b13RxRIx7aLmNmBlZCNJybqGx/CWwQdNG6UYnuUHSUa2rXWin
 9EmSrN0abF8Cb1+81qg59Bg+FJFqlEqN+bPJEArZ1s+eb7rC/+g6fiFKmustsTZmq9qk6GW47PF
 IL4eMrE8bX7y2e9N+5Z9lyNvcrbxxYbrU9JAXuS09XeMUCsIIAqIeku6j01P1J9XlfmKbS3Mh+u
 RiUd7DYljyZTUkC6tf6yDGhOyIjaF2iKG0v2SJ0npNXCIiC0TtDEzcsbFqo359VGtplvdVJYE9p
 THcrnTcA70lGYgrTafw==
X-Proofpoint-GUID: I3-37l4wtFpLbrqhe6q6Jo5UmesgWYSa
X-Authority-Analysis: v=2.4 cv=HN7O14tv c=1 sm=1 tr=0 ts=69837f4e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=DW_G4QuS8ySNF3ajTrEA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_091807_844563_A8AB41B5 
X-CRM114-Status: UNSURE (   9.14  )
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

The following changes since commit aeea3bf80600892be582a61de1551cf431341d9e:

  Merge branch 'robot/pr-0-1770184708' into 'main' (2026-02-04 09:13:00 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260204

for you to fetch changes up to 81a99dba039a21fd83d37a67a7de0fb80152e065:

  ath10k: WCN3990 hw1.0: update board-2.bin (2026-02-04 09:09:43 -0800)

----------------------------------------------------------------

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

For ath10k update board file for WCN3990/hw1.0 to support:
bus=snoc,qmi-board-id=41,qmi-chip-id=30214,variant=Qualcomm_sdm845hdk
bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk
bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=ECS_QC710
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_blueline
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_crosshatch

No updates for ath11k and ath12k.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/WCN3990/hw1.0/board-2.bin | Bin 742192 -> 867116 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

