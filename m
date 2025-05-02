Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4394CC3ABAC
	for <ath12k@archiver.kernel.org>; Fri,  2 May 2025 21:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4PaNRVXmQ87vuJiOT4xCDjQNhYIUUhavxLg1zz5jOY=; b=2RZxZMdHjEOSqRdNngj189js5y
	0jtKTTGomq1CexhB9BJAYcCrdwy+oMUtVLJ3H0IVbMQFdooRhf3DozdZfQYwPAupHcOnAax26uwer
	/6qVXIqK5EeOPA4WkTGy4NPU32oKZLWB6XVCvfRhVgh4Fl79KJlyZF+SApOLZ8KlG8fAMLIEWTtg1
	iU2352UdolY1uJTncgEqe5zu5SDSSFLSP69KSYB0OgSsyFlsMfdLtnn/EdoW1E6KZvAVoAxYeFXqb
	dBB6BHrWwOIbgjyJQnY0taOz0l9jctfJDNrLfIhf+4t38z/KzP/Fd8uQSCfVd2Kn6WHJRMAlIsS6J
	47jh6gtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxXl-000000031fy-3tJ4;
	Fri, 02 May 2025 21:03:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxQK-000000030fp-3BO4
	for ath12k@lists.infradead.org;
	Fri, 02 May 2025 20:55:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAxkt011529
	for <ath12k@lists.infradead.org>; Fri, 2 May 2025 20:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4PaNRVXmQ87vuJiOT4xCDjQNhYIUUhavxLg1zz5jOY=; b=Q02pJbCVW8UdTnB+
	4GlqU0d6I/PB9fiN9qHVIYFD6aTv8W67DVBIhkV08DhAqBTlBcK4V7COEfz6gMnY
	yKopqKU6PsRZBkIlv15zLoHuyhdwE9VZz/Fboe6ALTRQ091W+ilpWdg+s1zIhrua
	x/jvU/hrCcOhJqn+uF0782SXtTWcnY931KeVApQBiULU2EgkbczZU2nhkfxuqY8o
	pkyGeKis7R656+sAeDx0SsVy3ZDRjcwRv7IlB8C3sLYeQS+66WvxNk3ePHSAT1pc
	IpFxlsCVrPKRUYGZ0npQ8gdbqlwAB97mOezOgIk6aeSLtX2304dmeabqILqCPSmA
	A5sgjw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub1a5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 02 May 2025 20:55:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso1731124b3a.3
        for <ath12k@lists.infradead.org>; Fri, 02 May 2025 13:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746219353; x=1746824153;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4PaNRVXmQ87vuJiOT4xCDjQNhYIUUhavxLg1zz5jOY=;
        b=hUQgWJmQ+JBdvQx9Z5ph2GEgQAcJtBgjpmR5zrJnE1bVeTbeOUEslnDd2pWR3MvO7Y
         ttfXW/ldDrfAs0YGeGeiQo4crf2KhLsdZ8ArfeIFGPT4xHpjyiQQRImww4k68dLCQhyl
         kjNvJ5CJi5GuqZ+62pnAk74m050GwhvHO/eb5+Rd7uZWdQNTEw2AQ3Wh8Z/5hhWY2aYi
         chjBmg/mV7IbuksV5i57cMONOzvDv5jFbaa8yHq6GxX4gNMBPtE17/29w6uiu363VDX1
         Ff3NSg/MT03bBJRQCzElNuhUDZG0NEqN5IdXC/4F5BCEbjGV5PdazUypelS08gVJJ75x
         tqPw==
X-Forwarded-Encrypted: i=1; AJvYcCVb0nvJ8cmXmtqVPGr1jW5MTDJp2UX7oS2X22jnKwPen/7XcmQkx9VD1HsfMdmrkusN/yU6DgY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ/VjGfJgexNikV6hzHMQsYuoN/5wgak48bm6hwERHPT1KAbyh
	EfWwgImHQycxgAVlqTDcItZQQnqa3nhytDENPUIvCG0AvJ8BH6/XRI254zr/6sWSxta1HwXFNz6
	PindniLCwRevLtBOMDiisD4T2UMru/rEYiDgkMN1uCXc3WIaJ5TIo5/HFNxj1
X-Gm-Gg: ASbGncsvbKz7H5NjK/7RJ3tbqiu8ZwrD4z2N35QGCeQCdb6bx/qnH0Gn+BE0eq3rBvb
	4WvKfkOfe4RESgPVvr837ScnhPjjO4HGwwmeDSd+s+wjzDuz5Ep3F74ufBkNeSkZugakOXmAQtV
	KP5t32IqVQ+ZjT0YoQVhT9cNSC9d/DF8abSupGnoCtPqmfQDxCreqARrJWfZGGbodLn1njXMHUL
	BRVpqUDi1HGVTiO/CVINPHOdBEdVcyMVPL1yrkB0SgQQl8eeFPzFTMwk6qY/5zB6gArHSO/0yw4
	Kq9PD6H71RoSKPyAhPmu3CDmgJt+1phC23UAA8YFe8AIvv5KWaoYSAxCa0MeyMSySshSfp6+rrw
	CqIcq
X-Received: by 2002:a05:6a00:3488:b0:736:532b:7c10 with SMTP id d2e1a72fcca58-74058b20105mr6460973b3a.21.1746219353482;
        Fri, 02 May 2025 13:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFffGpZrtKkgLla/TGU4Odk3fNt5OEyPgNAZ/Qsl/1dqpk8PXNT9c+jTGvR6f2bz65hq7jgA==
X-Received: by 2002:a05:6a00:3488:b0:736:532b:7c10 with SMTP id d2e1a72fcca58-74058b20105mr6460945b3a.21.1746219353045;
        Fri, 02 May 2025 13:55:53 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020dc8sm2061507b3a.86.2025.05.02.13.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 13:55:52 -0700 (PDT)
Message-ID: <de8d2a84-6b10-4166-97b5-13ea2544fd46@oss.qualcomm.com>
Date: Fri, 2 May 2025 13:55:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] Add split-phy scan support in single wiphy
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250428151927.1169783-1-rameshkumar.sundaram@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250428151927.1169783-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g17SlDaubFs6UoLOg9GrfWIHEUeuy_7B
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6815315a cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YUzBHwSPIL57o_38h9wA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: g17SlDaubFs6UoLOg9GrfWIHEUeuy_7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE2OSBTYWx0ZWRfX86vTJcmjexGF Z6W5CoRRg+xscNT7RpmpLQDxyxPzIpmXPcwh0hHvavm11dnXvPXCHgIk/z2RabI0K4FyqUoN89K IQ7TkYrEgI3ccL+QJa7VdgJXmyrjOVuBE66KuPCQ0OKHBoGWdUGM4m5VXElHgQqy3tG7HVUPOAW
 8Thf0sGVbIiFPmQXoKK9VoBDS8B9O1tJcvkECEx/AbULrqyUaRFAbJs3r4dMxFX+Iy8ccwhGCHR q5lYvTXqkna6qSlLqUjSX6kjQG+05SRByXkBZais2wcFmU0VsUPIBa8M/NeuPqiRajGIq0X1Eo2 mZXpP1XWaOVufCwdt67Fq8xx0+AMPwu4hFGe3bPkYZx/U7+nFztW6yUB/4RX/n3GXRQPiKPvMkR
 25KbxfPoahnTjYgWpxdNGqSRR87gxkEsX4oeoQ5cenwTKoESTKGoNHfjaB/pdU5DE6IqMLTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_135556_945481_B4BBC8D4 
X-CRM114-Status: GOOD (  17.66  )
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

On 4/28/2025 8:19 AM, Rameshkumar Sundaram wrote:
> When two split-phy devices having supported frequency range in same band
> (as mentioned below) are combined into an ath12k HW group, they will be part
> of same wiphy and hence the channel list (wiphy->bands[]) will be common
> for all of the radios (ar).
> 
> 1 - 2.4 GHz + 5 GHz Low band
> 2 - 5 GHz High band + 6 GHz
> 
> When a scan is triggered with frequency list containing frequencies of
> both  5 GHz low and 5 GHz high, mac80211 generates a single scan request
> to driver with both the frequencies. This is because mac80211 splits the
> the scan request based on band.
> This results in driver scheduling scan for both frequencies in same radio,
> as driver always assumes that the scan request frequency list from
> mac80211 only contains frequencies for one radio.
> Split the scan request frequency list based on the supported frequency
> ranges of radios in a band and schedule scan to corresponding radios.
> 
> Since the scan request is split in ath12k driver internally, wait for
> all radios to complete their scan and report the same to mac80211.
> 
> Depends-on: https://lore.kernel.org/linux-wireless/20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com/
> Depends-on: https://lore.kernel.org/linux-wireless/20250417073954.632994-1-rameshkumar.sundaram@oss.qualcomm.com/
> 
> Rameshkumar Sundaram (2):
>   wifi: ath12k: Prepare ahvif scan link for parallel scan
>   wifi: ath12k: Split scan request for split band device
> 
>  drivers/net/wireless/ath/ath12k/core.h |   4 +-
>  drivers/net/wireless/ath/ath12k/mac.c  | 197 +++++++++++++++++++------
>  drivers/net/wireless/ath/ath12k/mac.h  |   7 +-
>  3 files changed, 160 insertions(+), 48 deletions(-)
> 
> 
> base-commit: 21346cd925c2567d5f56cdb1421c94815ac10221
> prerequisite-patch-id: 621a0dbeb6269fcaf27c808f951d9e2a2c3ac8f7
> prerequisite-patch-id: a9eebd8a3cc3b1ed9ed3574ce9fee088af9c5798

While this series applies cleanly on top of ath-next + the dependencies, it
does not apply cleanly on the pending branch (which already contains the
dependencies).

Can you please rebase on ath/main-pending, and post a v2 with ath-pending as
the destination branch tag? Don't worry if the patchwork bot ignores it due to
an unknown branch tag.

/jeff

