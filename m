Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A84ED339B4
	for <ath12k@archiver.kernel.org>; Fri,  5 Dec 2025 18:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=; b=Hn6qufCmNw6qDh9xflsmWGI+El
	HUpe19NitweLRyYlR9DdGXsqPcUSAeLKH0FZ1u4D+YLTG4Gwrc3mVJusx3gF+27G/3iPH+II6EB7U
	p5iqxHd5Jp11UZCqdeFfQmKEQenx4c4STqESeBCwLSitp/cZwp7Pdo5KK5oVvCVNUyeS/VGD7B7RF
	CHu++YS25LHO5o7ZgkYH4p+8LHF9JEe1eN/pr6fiDZjcBSd88I+atfCBb/LX05wAwVIDllmzl9o12
	QNHoQi0IxshU6qaq4a7RCR9f1ebTtrWtAPR3f+kjfTFrtH4eSpukJ6GOhmsNbiTGRjov+KfSBkfyN
	ieeqBqyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRabr-00000009oYc-1HHS;
	Fri, 05 Dec 2025 18:32:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRabp-00000009oXf-18iI
	for ath12k@lists.infradead.org;
	Fri, 05 Dec 2025 18:32:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBJj64177148
	for <ath12k@lists.infradead.org>; Fri, 5 Dec 2025 18:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EsAN77b5jlhTs52JfrYgOkM2
	xokQh050KDwqvxtezf4=; b=OxLv868mO/YqXAp+QmHwTnhQaTowfZihrImLFYR+
	b8Z8x/ewGBmOZGkUHHGSsA2CcvndMtvDHXTHB1letNOVkH4RvdlzyUmjol9qAsQ3
	CmFj4x+MsfyIOsCseUQSWIbyDRfdGE1HsGV+9xXUvQNwW0blpwcZ52E1AGe5c189
	M7yZBwT3h75IUmXS8sYqV4yz+hrCrbkvQ91767ePR2faSojIhg8WozMbc+/LN/Nz
	5iwmK/MLj8rS4Sad74bcoNSAbc0qxueQnnsF2c64IZnCauNPBLuwLcRVr1b1GtQ3
	Mwa3qfajp6tIWTJMN4UONvzP+tBhlu127Cy6KOBCuAV+Yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm59ajw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 05 Dec 2025 18:32:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24a25cff5so501931085a.2
        for <ath12k@lists.infradead.org>; Fri, 05 Dec 2025 10:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764959567; x=1765564367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=;
        b=ah4IkyTnO73s34PPs21+xOGqPF8hGB7hzwixCehoa7ivQIy4xPHUMcLVkAcakH+CL+
         VHNXtlOfH+nf+FvLPH7OVm7bYeLrosoW+PIISw650jRUMRPCBNFa2gdZv04QYyiFh/8Y
         4Zuz991YGQ2lMGpas8BT0EbHW8oCQHkwny8dAgCPwT91zfQOlBbIHRiz52jlFkRhgC6B
         Q0WQE6GCRiejuwG2sgWB/XNQdn/aepffhmb9V9tvr8JWaitwxVwBtTEq5F2UIdCswXXP
         blOlDG2m/0Ced/BcTFqntbPeZhx7Ryky2/GSW92EvyKWbDWpR+m8zEiF+t2JHRa8xzTb
         LptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959567; x=1765564367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=;
        b=Mdid8+Ga6D3Zeh1K+2lrY5b16m9tWUfSmW5/AWxu15wwCy7dHGApn4U1tTCkGvxy4R
         7wBAaka3fXBpPdeKigHmJwaHG2aQW7j3qvgaTrSQT1M2q1CbeH71oVacwU0WW7ACgefg
         V/f3orIRN1vIZw88Mkk07uf3JaVO91pfS+PFJl6ajKp0Kbc5bnrFUEBZytovAQChdgZN
         I9aL9heEeYS7uktbXzElSXA8Q72pPBjZfNwImA4zlRk3R4GAqTVadZBzl7KqHhe9kBCq
         PukM76etYeA1s6YMpwuGlHGLs4SbiaDcIQPjnT7nxTZRhvdcQb0hMbPz4CWHwaHMaH0O
         Qy4g==
X-Forwarded-Encrypted: i=1; AJvYcCUWjj7T8dLCu8Njwj1zlsNxNmpV8ZZ0hhmROWbx+Q00xYgU5hSWYnzQDfeipYTKvB95x5ASJ44=@lists.infradead.org
X-Gm-Message-State: AOJu0YxixYvH1HtXeSR9tBhb7FEQMpOUyjgVTgKmB9Eb4tWmUsfY6OGD
	FhvT9h+5uUohnUmW3qTyn8qExAG8zMNu99HOJlKhpWkjIQd0qfVBSQCXgV6QPqrSgz8sff2rmLk
	06JOt3sNnf3bQUHoJImP0lC0RBLNIo6EpnWctE1B65COLWUud+7Xi9JMnV/wl6Fce
X-Gm-Gg: ASbGncs6F+EIcBa8onIjLhwD7rH+uFobTPHSPlwLeqpFt4nL/JjlI77qrBrIbOdXkdf
	wKn/YVmg1dVTW6gc2V6hdeMrGCNNOBEBBVx6S5jddl+MebXHgQnDM/iP8eLrzKOMboXMu3Gcg8p
	h0LToH2UpiSR3a9vY8/Z+ZGedtUDqcavwxAD0Mm3oDNrfKMPVj6FrISbwrKOus0+CPxudLcOBzd
	FoWdOVB5izslD6zq5nFIR4ScFP9vcNWIy4VkuLp44pvLisSeE7D6C+r0gFxoQT0UHBV4pEmbp1h
	ER6uX1rWTFGIm0Y0P7GBYlizGskbdkv81W3utvne44HxgcW7p+C/6IfJbfYROcMGxLB6V4fRWfi
	RU1vLcpg8JxsAC59AAzQG12hW7UlIJ86apLijuE8Ee8fGxp3q0bMHgmaKVaC9MIV2sD8/J4choA
	Y8LQ4nkeOFfO1iArM2yYYPBP4=
X-Received: by 2002:a05:620a:4095:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8b5e7451b33mr1656360685a.75.1764959566963;
        Fri, 05 Dec 2025 10:32:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF083DzGWn2LEo8Ae9UWqRNGaIZu8Bc7SHuw0in/lgRyW4AhyA5NMTa/wtyUxLpleFgvwoOSg==
X-Received: by 2002:a05:620a:4095:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8b5e7451b33mr1656356285a.75.1764959566491;
        Fri, 05 Dec 2025 10:32:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c27f0asm1710142e87.74.2025.12.05.10.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:32:45 -0800 (PST)
Date: Fri, 5 Dec 2025 20:32:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20251205
Message-ID: <ggvvbyrdqvbjjf5kxvnzswwpkzsbnnjc5hsw37qreyrekheoze@p4iavaks7rmr>
References: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
X-Proofpoint-GUID: d1Y1dNuUuogHSAxJEOM6ljWzBdlhk1Pu
X-Proofpoint-ORIG-GUID: d1Y1dNuUuogHSAxJEOM6ljWzBdlhk1Pu
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=69332550 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=BankifvHBk-6wX3BIUYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEzNyBTYWx0ZWRfXyuffY5uZsefq
 s1qEuhFd2WmpXb65pkOjT829MpgSfTEKwAJY0oY2wkgLnetQTreyI1jX4w5gCYtpPLLBhxjMlrj
 PFfKchs00enM3aYZ7rIN8IrmMJpkm7bRIr52K2JcRMkZsEYjzMZQprNp8Tj5FI9uKrIF5SQJA1X
 slD9/+jn/uogxsBGYb/QeJD5bZPYdL9gy+bela5oROTd2VPWLdcCP1YVYUC2Mjhx+O2vBCmmxoY
 yvCqou3ee79FbIhDpdRKUo1Br+xHjzyvWs49E8u85McXf9yrsm4jvnuJ+MAme+ogaoHON1nS++2
 hip/dXFDmDgjCyzHhBOzJ5bXkx8dCvsxkQ9PjDa+mZwpTU9ithKzieTCuK/V2aZPCHKc+QGZaRu
 NL/lxVR64yAW7qTYEY/puAGel2w+Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103249_319802_826D15B3 
X-CRM114-Status: GOOD (  17.85  )
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

On Fri, Dec 05, 2025 at 08:30:02AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> Only ath10k board files are included this cycle:
> QCA4019 hw1.0: Add Netgear LBR20 specific BDFs
> QCA4019 hw1.0: Add Meraki MR30H specific BDFs
> QCA4019 hw1.0: Add Meraki "underdog" specific BDFs
> QCA9888 hw2.0: Add Netgear LBR20 specific BDFs
> WCN3990 hw1.0: Add board file for the Arduino Imola (UNO-Q)
> WCN3990 hw1.0: Add Xiaomi Redmi K20 Pro/ Xiaomi Mi 9T Pro specific BDFs
> WCN3990 hw1.0: Add board file for Huawei MateBook E 2019
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/819

> Thanks,
> /jeff
> 
> The following changes since commit a0f0e52138e5f77fb0f358ff952447623ae0a7c4:
> 
>   Merge branch 'amd-staging' into 'main' (2025-12-03 21:05:40 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251205
> 
> for you to fetch changes up to 05c97f71a5336854054db1dd4acdaf68c5b7c144:
> 
>   ath10k: WCN3990 hw1.0: update board-2.bin (2025-12-05 08:20:14 -0800)
> 
> ----------------------------------------------------------------
> Jeff Johnson (3):
>       ath10k: QCA4019 hw1.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update board-2.bin
>       ath10k: WCN3990 hw1.0: update board-2.bin
> 
>  ath10k/QCA4019/hw1.0/board-2.bin | Bin 1822336 -> 1895232 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin | Bin 218596 -> 230744 bytes
>  ath10k/WCN3990/hw1.0/board-2.bin | Bin 670116 -> 742192 bytes
>  3 files changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry

