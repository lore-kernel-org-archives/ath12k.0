Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0004CC19776
	for <ath12k@archiver.kernel.org>; Wed, 26 Feb 2025 23:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LTBZs9SF4fpm2lgn+jTmnQ7wDyI4IyFnmtDMU4kFjVg=; b=UuUUjfS8x/vzSiM2HmEO2hvCiQ
	10wlfBp0tFx8I+QuOjGgNkaqGpjazFP/1NO0J67GAz+2uqw7ULgq+E/7283Z6qd6HrrpMUS93OirT
	u1Bja9EMC06pnxxAmTXJen0N72u7UEFbCpFxgyb1kA3aSSU4N8yCmzPXKreo0bmv7HhiP49pfP1V2
	uF8lUjzeZGs9k0v0mNMru2JUODTCBgA7EHMg6oiHwcuh19Lleta4QeSlZiQT8Mhk6XB/iQDA5xBk2
	lbBBCSxm4wBuMiuwQ3mKaxpiSOI9troy9g+TL2K/qRg9DIcXBwFXjdT9/OQUVYQtL5k9D8aEzTCN3
	SlRgwWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQWF-00000005erU-1zY1
	for ath12k@archiver.kernel.org;
	Wed, 26 Feb 2025 23:08:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQWB-00000005eow-39em
	for ath12k@lists.infradead.org;
	Wed, 26 Feb 2025 23:08:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QLSZdB015559
	for <ath12k@lists.infradead.org>; Wed, 26 Feb 2025 23:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LTBZs9SF4fpm2lgn+jTmnQ
	7wDyI4IyFnmtDMU4kFjVg=; b=izyuXY8776lZXRZGYb+le/PtTC30f8Ensm5VI5
	mJvjWtXReWm2xUzkV2SEfSZFiLKznBWj6E/lp/m4PjdJoO3iFaXJIyNJg8F42iqa
	DyIRiqQB0sHzfj7AjtxSS18kIg/LYD6DqGJLHDuqy24oKlF41nop0apyYwgPCeL/
	xL9RVugCRksJIWQM7oMopws4Fx9B8Z/Lyo+aN9iS+2HzOuxu/80Q5aI0ro2FwrdH
	Paaz3h6IBanH5ibL0Oup7G4XNUhTLRz1YS4lnuzPvBfcYAI/Xi2241Q3XpltTQhT
	xJUuVcF3qp5RH4FbZWK1zYSENewpHi6zgtwAFd/qG9FH/LzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnkk24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 26 Feb 2025 23:08:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc404aaed5so1049825a91.3
        for <ath12k@lists.infradead.org>; Wed, 26 Feb 2025 15:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611321; x=1741216121;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTBZs9SF4fpm2lgn+jTmnQ7wDyI4IyFnmtDMU4kFjVg=;
        b=Q8TA99Sc0OY+tY85Ku6bmB0Rpm3VG3mdY2TmjtbBQMEWOfqKV12IXxZhSw9AL6TYaD
         jyZxSLe4ZGyvP1ZdH2pZibpwzAGcviJ2+lhloZtWO0GqGMZ4hrtKj4PEJwcfxuJOSUxN
         IHeOShdA42rd/G2pAhYssoGqt1uQ/yPm+O9ZwDAC1NmTRpfSwNDQyTMp9E1q7aYFWOY8
         YneJrOLoOxMiBYcpzv3vyu2lY2nh77OrVAgN1WB6esXBg3iGv9nDkWzmJtsvrXItgUte
         uj/nnc2H+o1M2GFZFtzXUzRUYGxI/5+E+WE8pNTuzs48bzFNpHTx/sEmz2doGL91Cj4m
         geiA==
X-Forwarded-Encrypted: i=1; AJvYcCVPCdDcMc+daCaYvqq9uO3N1x9aP4Ed07dnRStQwWpVn6krgB1uhqHtTb3kM5hQmIQp1ZYCzYk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAT8DpRV2jVt2La5Cjj/YJndSPOy72Q3p2/K2WzQT0/LCTsRml
	UgDmJjf6FRVlNnB40iC2ngjTAmzndte2LE50XUn4Kav6XdfheYem6AOA1bPWFYC6GEDsjtLT7QX
	Miouw/2aXjSIrl3j/RsM/QzBP2tw+C4NowYKqgvDzO/G0JcbTfuvZS09n183C
X-Gm-Gg: ASbGncsAiIba6oA+56bdKCDr+j1JGGSJcPSFuTeDbVk81bA6hTgFgFt0UjXSvDlgJ2I
	uJzlRH3McAsAf+R4QMW5h1oxjX7NnQfolnuBvRTmx4fa32LHSXhDpx0muuni9QxQGD823gHAcqK
	DRRJ8XwRhVCctwjrDD6HwEQRIJdqF2dBoe5IXtpDv53Enihf42Pa7YkhZRVNLvlWGXYbIzfP4IF
	4cO4WmQ8DEYt4UVV6XYzD92rT0QsgWtruYgFAffYXzBNq8DK12rwbF3viCXceJQas79kCMKe0sv
	TJUqfr4vHJdjE3k8Uy6b0V373Zm0PoOkHPzV+WwUauhQg4T8lZ3jg0ZtEw+bsOgfxghY2t7aUIO
	se67DLvel
X-Received: by 2002:a17:90b:2801:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-2fe7e2e9383mr7619622a91.6.1740611321170;
        Wed, 26 Feb 2025 15:08:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi7qZNiX0sKtWPTcuB/eIr8dt0T1qi6fJxqj6hhLa0VCjr9ZSHqkY938CIh8bXwMOThPw/zg==
X-Received: by 2002:a17:90b:2801:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-2fe7e2e9383mr7619600a91.6.1740611320838;
        Wed, 26 Feb 2025 15:08:40 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6752095sm115827a91.1.2025.02.26.15.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 15:08:40 -0800 (PST)
Message-ID: <74b29af1-4024-4636-af8f-a95fa0f3601e@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 15:08:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware 20250226
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W3p_WStWr5dj7orj6-Z0VnNvO8hyxAZF
X-Proofpoint-ORIG-GUID: W3p_WStWr5dj7orj6-Z0VnNvO8hyxAZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_07,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=938 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_150843_905724_C1ED6DBF 
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
Here's a new pull request for ath10k, ath11k and ath12k.

This request only touches ath11k, and adds new firmware and board file for 
QCA6698AQ hw2.1 and new microcode for QCA6698AQ.

Please let me know if there are any problems.

/jeff


The following changes since commit 1a1470d90de2a25e5befadb2f1fa30758af682ca:

  Merge branch 'robot/pr-0-1740366711' into 'main' (2025-02-24 05:26:03 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250226

for you to fetch changes up to 811bb52b1d293c3a9641c8747c8963ade18b7e81:

  ath11k: QCN9074 hw1.0: update to WLAN.HK.2.9.0.1-02175-QCAHKSWPL_SILICONZ-2 (2025-02-26 14:53:32 -0800)

----------------------------------------------------------------
Jeff Johnson (3):
      ath11k: QCA6698AQ hw2.1: update board-2.bin
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04604-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
      ath11k: QCN9074 hw1.0: update to WLAN.HK.2.9.0.1-02175-QCAHKSWPL_SILICONZ-2

 WHENCE                             |   5 +++--
 ath11k/QCA6698AQ/hw2.1/amss.bin    | Bin 5132288 -> 5140480 bytes
 ath11k/QCA6698AQ/hw2.1/board-2.bin | Bin 866120 -> 986384 bytes
 ath11k/QCA6698AQ/hw2.1/m3.bin      | Bin 266684 -> 266684 bytes
 ath11k/QCN9074/hw1.0/.notice       |   4 ++++
 ath11k/QCN9074/hw1.0/m3.bin        | Bin 340108 -> 340108 bytes
 6 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 ath11k/QCN9074/hw1.0/.notice

