Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1588CCD184
	for <ath12k@archiver.kernel.org>; Wed, 15 Oct 2025 01:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XguhgPSb2jGbmrXzkt55w5yzbjQrVAAyZ356vnaWs40=; b=Y8Eo+EoWVFELRscbKe7oSm50J1
	QaACizpLfumIytpAmZugeB23V0QA0KeJWou1VG/0NfwXD4S41b54+DuwNrVVECxTj2+CMjXiMbH13
	v4qIjCa+ikZfqlGSTFotQ8xuUz/Epc5q6qiyNLUOobQc5rClntWxMIriZhJjgjs0xU6S3ZY8loZwy
	FqZprqjvx2Ee+ajJlnoKnaAR4a7lyCSj9ZooKQITnyqQmrZKoKai1HUUW8y2/pPH4GUd6H5ZI7ZsK
	DB9UtFbCYDZMGq7um02t3Ov9wMpS32ad4zj7cM3vKgPV+g2gezPRvx9Mtdqsv7RFtbFf0954sV8m/
	vS5w79mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8qiW-00000000CYA-1M7H;
	Wed, 15 Oct 2025 01:54:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8qiT-00000000CXY-3Oi9
	for ath12k@lists.infradead.org;
	Wed, 15 Oct 2025 01:54:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRRkH016588
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 01:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XguhgPSb2jGbmrXzkt55w5yzbjQrVAAyZ356vnaWs40=; b=QM4ipGQ1Cq08kJtK
	ifyPUrkwohC4srs7gu0ZDzf5R0EL8YvfmhrvpP8wSpaxfvJdWmOJBqIpJl25jw9z
	32GYtq3bqkOQeQyLmn0IY2rQwen46ZAVy7t92K/qqXyb4yfUu+As3WqYed0XNi20
	TnbUGNoPEhMqX/zeUq+6lnoVSl/p2xMx4msRr2y7J4ln+pB6IsUp3+JC9lvAQArB
	YOV59i0g3ZVSfRM7zBeBLBiV72ptM32eICBWCuSXcBRPX3OsXWURN6IgPdxgJIaP
	0OBSjSnT/EgEB/IWZJxEgprXJpxo2AFnUQMPy0cfFCKLTGCe3GN8EN+S7Su4/cfB
	ccVUZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg2h94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 01:54:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2904e9e0ef9so130216075ad.3
        for <ath12k@lists.infradead.org>; Tue, 14 Oct 2025 18:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760493252; x=1761098052;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XguhgPSb2jGbmrXzkt55w5yzbjQrVAAyZ356vnaWs40=;
        b=kbaa0k32lcb9SHJvdH1gGHJB2f+N79FlSFQBm90/+WKv0WaPPVNL4ahQHkADYa/fLi
         wWnhveln+gqPIo0lW1Q0rRa75rRPqjDFZTNhoZIzRF9ben2REbXpOtkFs0biqYfVNWBN
         aB6bxxzqN44kyCuJlkzzgbSAKRchIKE6c2+XQMOGamhjs1yrsjUO1138KZwPI0lyXgII
         bWGJZd6IGxXf6Z5wHTKXXGiUJEqHJInIp30a8KFZ2Zn9FsOM64RcHX2xzZ7GtrGvRB5N
         WCzw/ykY6kJ/H4qGrGKxLLBpOnBfa+RxPRs6OkBDEN2GhHloPY80ezS29363w+sB9alZ
         Af3g==
X-Forwarded-Encrypted: i=1; AJvYcCWFdry07fajtf+EuBXKZoOt8qZSAakguX7/vQrvJwvZe1zYiyX5EKmwnrK19QC1djuU4cWTzNg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpiNN0WhM4jvIAnlEc22BPt/tV3Yuy5qUgQSf94aZyKx6b0D5p
	+ydTm0YM/NzFGIsLKjwfzkMy8B4iNEYAZi/s+6XvSwWqAGKXltvoTtRd67vagmgX4Uwp95SzM9v
	5venAwPn3rQKehyuTg64RsyYZykq3pzRVgWnN9XcfS4k2MeXC3k1F2V5IlBPMeK0QAu/xblBW
X-Gm-Gg: ASbGncvcvd8tAyBYN1wlO8YsNqPmrHrq2eBE8b1hY+EtiM5+udEFvmgciqS4+xGbtvI
	C9YpbYRxG1UvOy6yy1ZQAfhbr/H3NwRH3tC0TiE8GMIkvAWlh1PJzXO1xLs1UyCLOfq1wJKoY9S
	f4ZlR7/KEri4ciO1jEu1x38I1CG3Y/5DAutV6Y3Mhscs68HhC/bIE5u1W+PZO5DpVDKrXxsIprw
	xqDnIm9BNvGre9kAEu3bmXMA0fjv7s42jNLOyyP1SSiCJ3uUZMTO0KyTeDycFhYxNWfMVuJSj1a
	X2ztXvh0FcFHy8FwxCRdKlWMhsYYxLrvtNIdJbXOWqzHtMKbzAq+37Mr8B9QwYJby3OZbShSalb
	G9N3dezRUi289EMhR9W1JXBi5ClLgOM0Kk+zJ
X-Received: by 2002:a17:903:2f0e:b0:272:a900:c42b with SMTP id d9443c01a7336-290273ef03dmr336448295ad.31.1760493251635;
        Tue, 14 Oct 2025 18:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSUnTmCJZJfY+b+YhyGDGGxTzm/b/3JAT80p2impJagMmbxMK2tYwLiNTPAty03cNDsYl29g==
X-Received: by 2002:a17:903:2f0e:b0:272:a900:c42b with SMTP id d9443c01a7336-290273ef03dmr336448015ad.31.1760493251111;
        Tue, 14 Oct 2025 18:54:11 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f070basm178907755ad.77.2025.10.14.18.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 18:54:10 -0700 (PDT)
Message-ID: <b6d1ec91-e487-4bf4-b09c-f9fdb2c6c003@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 09:54:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NCM865 - Linux - Incredibly poor performance
To: Ross Brown <true.robot.ross@gmail.com>, ath12k@lists.infradead.org
References: <CAMn66qZENLhDOcVJuwUZ3ir89PVtVnQRq9DkV5xjJn1p6BKB9w@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMn66qZENLhDOcVJuwUZ3ir89PVtVnQRq9DkV5xjJn1p6BKB9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX65BktBjaI86g
 ljjjOhR8/km4q4sISA54g5f3ZNt2fjiTaVn1tLGJzElRYelPcYJPpcp7Wsu0Dgw7Mw75ABVfsZU
 qUZz/UJIejMofngHHNQ4zheJtHJQpilUs/p7pHXb+2XpTn22VGOZDmzPOu9uNrfrFfhMvvYdu57
 NGDLYIzzh1tyQMueaGKCVg4chq8cuMZ58+szTRh8ZkHlC33ojnNbAqDnLPA/zz/A+yD+p9/zON6
 BXvElvguJCvuJ/0DxYdpf1VczOODl6tt6w5Oz4Y23wbOwXNsinTK3K9cnf0fO0SV58VqMWzcllc
 2wLlI1xYVbI/t0v5T4NSLFzOT0GWLFBk6gbxote6fOHPv20mSHceeT0W4xPwmuIoBaRsKDDHDzb
 B4ks6UFNJAlCZAms/K5LWTBQUGs6BQ==
X-Proofpoint-GUID: vhgms6gw7K981aEh0JHskIvWuS0IlHf4
X-Proofpoint-ORIG-GUID: vhgms6gw7K981aEh0JHskIvWuS0IlHf4
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68eefec5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PMT70qdeAAAA:8 a=lW1pDSHbrnmzQLDaFMwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_185413_855617_607CF38F 
X-CRM114-Status: GOOD (  11.73  )
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



On 10/14/2025 6:55 PM, Ross Brown wrote:
> The NCM865 chipset suffers INCREDIBLY poor performance on Linux -
> usually about 1/10th of what adaptors from other vendors are able to
> achieve from the same AP and same machine, in the same location.
> 
> Fastfetch output:
>              .',;::::;,'.                 crystalyne@ross-framework-13
>          .';:cccccccccccc:;,.             ----------------------------
>       .;cccccccccccccccccccccc;.          OS: Fedora Linux
> 42.20251014.0 (Silverblue) x86_64
>     .:cccccccccccccccccccccccccc:.        Host: Laptop (AC)
>   .;ccccccccccccc;.:dddl:.;ccccccc;.      Kernel: Linux 6.16.11-200.fc42.x86_64

since you are using 6.16.11, can you try reverting 4b66d18918f8 ("wifi: ath12k: Fix
missing station power save configuration")?

>  .:ccccccccccccc;OWMKOOXMWd;ccccccc:.     Uptime: 33 seconds
> .:ccccccccccccc;KMMc;cc;xMMc;ccccccc:.    Packages: 1521 (rpm), 57 (flatpak)
> ,cccccccccccccc;MMM.;cc;;WW:;cccccccc,    Shell: bash 5.2.37
> :cccccccccccccc;MMM.;cccccccccccccccc:    Display (NE135A1M-NY1):
> 2880x1920 @ 120 Hz (as 1440x960) in 14" [Built-in]
> :ccccccc;oxOOOo;MMM000k.;cccccccccccc:    DE: GNOME 48.5
> cccccc;0MMKxdd:;MMMkddc.;cccccccccccc;    WM: Mutter (Wayland)
> ccccc;XMO';cccc;MMM.;cccccccccccccccc'    WM Theme: Adwaita
> ccccc;MMo;ccccc;MMW.;ccccccccccccccc;     Theme: Adwaita [GTK2/3/4]
> ccccc;0MNc.ccc.xMMd;ccccccccccccccc;      Icons: Adwaita [GTK2/3/4]
> cccccc;dNMWXXXWM0:;cccccccccccccc:,       Font: Adwaita Sans (11pt) [GTK2/3/4]
> cccccccc;.:odl:.;cccccccccccccc:,.        Cursor: Adwaita (24px)
> ccccccccccccccccccccccccccccc:'.          Terminal: Ptyxis 48.5
> :ccccccccccccccccccccccc:;,..             Terminal Font: Adwaita Mono (11pt)
>  ':cccccccccccccccc::;,.                  CPU: 11th Gen Intel(R)
> Core(TM) i7-1185G7 (8) @ 4.80 GHz
>                                           GPU: Intel Iris Xe Graphics
> @ 1.35 GHz [Integrated]
>                                           Memory: 2.61 GiB / 15.40 GiB (17%)
>                                           Swap: 0 B / 8.00 GiB (0%)
>                                           Disk (/): 21.36 MiB / 21.36
> MiB (100%) - overlay [Read-only]
>                                           Disk (/etc): 34.72 GiB /
> 491.06 GiB (7%) - btrfs
>                                           Local IP (wlp170s0): 192.168.8.191/24
>                                           Battery (Framewo): 44% (56
> mins remaining) [Discharging]
>                                           Locale: en_GB.UTF-8
> 
> AP Used for speedtest: GL-iNet Spitz AX X3000 (Performance degradation
> seen on all APs, not just this one)
> 
> NCM865 speedtest:
> speedtest-cli
> Retrieving speedtest.net configuration...
> Testing from toob (145.40.178.183)...
> Retrieving speedtest.net server list...
> Selecting best server based on ping...
> Hosted by YouFibre (London) [111.02 km]: 90.277 ms
> Testing download
> speed................................................................................
> Download: 35.88 Mbit/s
> Testing upload speed......................................................................................................
> Upload: 64.41 Mbit/s
> 
> Intel AX210 speedtest:
> speedtest-cli
> Retrieving speedtest.net configuration...
> Testing from toob (145.40.178.183)...
> Retrieving speedtest.net server list...
> Selecting best server based on ping...
> Hosted by YouFibre (London) [111.02 km]: 8.698 ms
> Testing download
> speed................................................................................
> Download: 551.98 Mbit/s
> Testing upload speed......................................................................................................
> Upload: 605.40 Mbit/s
> 
> Mediatek RZ616 speedtest:
> speedtest-cli
> Retrieving speedtest.net configuration...
> Testing from toob (145.40.178.183)...
> Retrieving speedtest.net server list...
> Selecting best server based on ping...
> Hosted by YouFibre (London) [111.02 km]: 8.932 ms
> Testing download
> speed................................................................................
> Download: 582.44 Mbit/s
> Testing upload speed......................................................................................................
> Upload: 618.28 Mbit/s
> 


