Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2E2D33981
	for <ath12k@archiver.kernel.org>; Fri,  5 Dec 2025 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=; b=KqsWxCfyjlVuc2GPZGJpQLU1o7
	7JxglvRNTxrD7N735CKlKruHMxxqk+fDKihoyxC3qhKrM+JnCwF4rHxhHb9h8G0XCXLvh63UXZ/Z4
	fU0EsDG1FcV9jRVdsW3SPZxOgSOvU9B9NkzWiX3Ao5tsiskbZu+mL2qPYXQBsOhQneWTWKq7c8gOU
	pqYl3p5OiwH7z9hG+Ua49rPmQ4DqD7r1SW6wOodqVJ0rYAa9nulnRWrbsVcXwi7p3lCn23ll0A3Fn
	LhF9W48Yan7UPL5PAfBtZtPVZI/v8udqvjkrRoDkFOo9LJtdLbBEhxL84rtY0+ActWPWvAuwp6cwU
	aE5gCy7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYh8-00000009hmI-36nj;
	Fri, 05 Dec 2025 16:30:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYh6-00000009hlB-0YFE
	for ath12k@lists.infradead.org;
	Fri, 05 Dec 2025 16:30:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBPHi1255949
	for <ath12k@lists.infradead.org>; Fri, 5 Dec 2025 16:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uY/zz/FmTheKinzMsruxPA
	eAFgeFSh6MXrbrP2Vw8Ck=; b=AmewZFZuTpnfOwXbHKGEFposUfJyFi+9L/sM1r
	dSP3z8QBY0s66WGN4QyK0LiJWmXsSTQKVNyoVvL4s1MnLL1Rhj7gRAT4lNs2nURK
	dXHXbwhxGEmkvjv8VHTbYeo1HDmUf46r0p770SoRRFiX5mGiFt+xObRaXGrpEgo/
	CnIpWfQmW+Sgv/N5Ch4PPntC5ALF1km241FZ0pnT1Mk+k1E3nLSOj1W54UjHiUhv
	6wxXjP38eeyJj3JO2sFOcSCJadq8QQECu5O9iFXzot9W7jffAsdqNyk0UiBmYzZh
	gqmSJhtxjEUoF3w2O17fdLobl4KIkCGudqsdbL45Ahy+TH2Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj2n0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 05 Dec 2025 16:30:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2958a134514so33253795ad.2
        for <ath12k@lists.infradead.org>; Fri, 05 Dec 2025 08:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764952205; x=1765557005; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=;
        b=MF79Y7YEc9QYOsy4obiYlVtslWr0eCkoU4OVmxlfEGnQJEDo4WqM0iZmkOCwW0hEyO
         MT6yzQlsZLRYtDVuzjgLPn4dwtrGdznGjDKhXKxpczKJM/8pU/NqStPFHXY7osRG/aI2
         wh5lO58ZrlB8EQdryc7tEHvLSWYQRUnW27rAkK96qM2nttMFK2eaA0RSRL/d6U9YgbNN
         /u5GZB6pxjvyhMFed026CqAotESk51l9GutM2nq5Jr0o5kNe1QzofKwTfCgZltMKGGS7
         EuqphSqw/XWrZq80P5E8fZBri373uxX+UYoqYyFu9IBiV8tRaVai/QGYQEpbgaDd3m88
         NyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764952205; x=1765557005;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=;
        b=Xlb0H0/komBrDnmhu2RLowgOdo7QGifzc9pAwoqaCJ8fPUVF6LUZzQAuSrFw6bP/M3
         aRyz1mYbdpEKh1YlVsvvqL39r7sqL4AKPgFY6LuvJ5Wy1oPpOFJPGiubz1oc15W92apx
         H2WKIAqQ7ll2/BfITJ9jhirkoSvKPjUNFFz+ZtL2hltu0cizTeQHSSTimU+nMQwI9VGt
         bMZzZxVMzzlf0TXYsAuN+wYsFJuII8gsEM21fl89k8mcVRc3mqdx5vQyv+rKgSMQwIb8
         N6P8n33RbebCnYHzvcMUgDDJfTP50Gi4gyQRjYrHT9knp3IoB9sS0yRHFy931F1PcgD9
         th3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8lPxMZTidY+p+vyxg7oEERbVQLbKebKPm5+L3526+h3RtOkDWbmkys2SEIdFN1T++xwmKR5U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjWOb5VKKEYeDjnqEjWaLktISeZq/LNj6BcvMhO8zUivwswDac
	BxS/Ucu/Dypp7lJfeXgif3mwZbaWdEojKQd2KapC8mFlIvIXhZ9k7d8pAWx53C1wqNkTVUArWe3
	7QG1Jx0HVqPSaP90q3evKqLUOaZqdjToI+i5j+met2fvJCIgCUnZsz4wHxir6OpLg
X-Gm-Gg: ASbGncsP1TZ8cnpwFmuHNW1KR2JNmCFKjKwfGecfJ1ukGM4HVW0IPdSdG8XWkyhGVcw
	itbv3Q8xmQqUTqIcB0v2LxuU/x4qXAF4jvQXBlJPzIqY+TqtE1gv4eeLdR8sjeNKaZL+gFAUUCd
	eSaeK79TzSzcDrsxZ/gxSmUCLivrN250MHBJOKhNGJ3TsqZixtsbrW/jrHh234nVghJpkMLqvOb
	XHQeBbQ8a//Wa8Eu1JkHl8VlFVlQojFOv59IcYM38tTMV8bJx9Dl7e/tq1OttOZdK2XCTUwUq2N
	88jOz2YKxqEagtW0ibpIaMDMvl5y+jgF+OeQIgaewI0LagNHOOLxQfmk2xRB5uif9oMlf5xH364
	ehtXWMP0Pl0IVq7xVHqdHdbw4qHDxnRx7X+AmpfnjkS0z1g==
X-Received: by 2002:a17:903:1b28:b0:294:ccc6:cd30 with SMTP id d9443c01a7336-29d9fb6eb47mr88186805ad.17.1764952204097;
        Fri, 05 Dec 2025 08:30:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoqCm17nT0SnoxUP5EoDhHux+tD0gpH6iUAYDqqKgBNd2YHlT+I8Pl/pJ4QXlhgtjs1gu46A==
X-Received: by 2002:a17:903:1b28:b0:294:ccc6:cd30 with SMTP id d9443c01a7336-29d9fb6eb47mr88186545ad.17.1764952203564;
        Fri, 05 Dec 2025 08:30:03 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae33c2e2sm53266725ad.0.2025.12.05.08.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 08:30:03 -0800 (PST)
Message-ID: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 08:30:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20251205
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=6933088e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=81yDGmwx11_j3xA_CzoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3gby_8K5eXwKtp-UbrPCo8R5ui6LyxhL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEyMCBTYWx0ZWRfX9qwdswRe2TyN
 JxeJsJq/+nW0bGVMJZGRFZiJpNto2TGhKQA2tdni4a21ZqU33k9vMkfwE1F7VQvcTYq00Sk8rys
 dL07ihagcTbJyKod/8RJAdYES+oUg/uV/q3B8PiC3/XN+620ZdITPwXg56TmD5HgAoRek1YJdKG
 qGR1SRyKPYOz1EBnH0rSD8BM9F+JB7AHg05pSZnfFc9cY6pQAfA/OBgrddGIZknfoh7ZcYm5ruR
 gPuNPY0hkordUTZxZGeYVXTtoEEYvEoo8gKOA5C8BDNfV2J3Gd3kmOwhEOzEBnhFaAe81LFVbbx
 icJKNWmobvVu8ZoP+dHBcHE+LlocftmAkOb/nQ0D6eSUp8XHO/v0H1PCJ9Km/sXWoMNKI9Aj1Hz
 IUQZpRk7iO45kR0SdkEYACS40jP5kw==
X-Proofpoint-GUID: 3gby_8K5eXwKtp-UbrPCo8R5ui6LyxhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_083008_339720_3008EE17 
X-CRM114-Status: UNSURE (   8.69  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

Only ath10k board files are included this cycle:
QCA4019 hw1.0: Add Netgear LBR20 specific BDFs
QCA4019 hw1.0: Add Meraki MR30H specific BDFs
QCA4019 hw1.0: Add Meraki "underdog" specific BDFs
QCA9888 hw2.0: Add Netgear LBR20 specific BDFs
WCN3990 hw1.0: Add board file for the Arduino Imola (UNO-Q)
WCN3990 hw1.0: Add Xiaomi Redmi K20 Pro/ Xiaomi Mi 9T Pro specific BDFs
WCN3990 hw1.0: Add board file for Huawei MateBook E 2019

Please let me know if there are any problems.

Thanks,
/jeff

The following changes since commit a0f0e52138e5f77fb0f358ff952447623ae0a7c4:

  Merge branch 'amd-staging' into 'main' (2025-12-03 21:05:40 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251205

for you to fetch changes up to 05c97f71a5336854054db1dd4acdaf68c5b7c144:

  ath10k: WCN3990 hw1.0: update board-2.bin (2025-12-05 08:20:14 -0800)

----------------------------------------------------------------
Jeff Johnson (3):
      ath10k: QCA4019 hw1.0: update board-2.bin
      ath10k: QCA9888 hw2.0: update board-2.bin
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/QCA4019/hw1.0/board-2.bin | Bin 1822336 -> 1895232 bytes
 ath10k/QCA9888/hw2.0/board-2.bin | Bin 218596 -> 230744 bytes
 ath10k/WCN3990/hw1.0/board-2.bin | Bin 670116 -> 742192 bytes
 3 files changed, 0 insertions(+), 0 deletions(-)

