Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FB7C982EA
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 08:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V81J0//aP7Eaf0ycXsuGgGwagnYfs3gvKKc6hSebF7A=; b=vzUpIAzpt8Uy4O8mA2JslYZBUa
	Sl3nG8uL2fqY+5DeFopcp1VaHveF1ikC83vxnBX20xdDm8ebNNAJnIUVqcK/mBO9MbHwlKrX24pq4
	axui+UAEw932uAhOOOXI5Upotxx7GpKO1pqZrLFpyo+5xQ7Jj8yBwLSdSvvP6yRQyub/7R+Glki2s
	o6R7y57A7fl9nrCpoVnzGe6+D5GetuApBu/BJw9xXN7VtvG+fXL9LqsMJUgUoXaYCakDxoudaUoGC
	yc9zNZW3lfmxlZT1ixiuWQWXR4PYKkryC1ZKETwK6LkAUsu36G8mC6Nd89HIL7gV73n4Gy3VCmGeQ
	UEdsW2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IhF-00000007bY5-0AEG;
	Wed, 23 Sep 2026 08:51:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IhD-00000007bWs-2e8W
	for ath12k@bombadil.infradead.org;
	Wed, 23 Sep 2026 08:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V81J0//aP7Eaf0ycXsuGgGwagnYfs3gvKKc6hSebF7A=; b=IQgEV4sKh1mmV0bvgpHVXEc3TW
	dp8X9ifea5DaJjYfACqAh/PclwGvINKmF5I3Ra+2F2cgfrlV5S8005YXynCq1fv4X9i1vfs4vHT4L
	0+hBzOwmXrDlpN0scWO4Dhhdv2gHTDfBle0HcTLvPHsB3CMZFOVknng1W/Y7g7f5wLIDk6gELMMXW
	5EawLR4ZV2b7Ue527IXvAl/wCDip1+8zFHiFXrOcMQjfxx6KPFtWCIhBkUzdJpi7raBKseMcO3Ojj
	4dptR0xt3m1uh6DD/0Z7CcHXMWguI7Lmwq6dhDvEQPpMdgpuycRdMxs+gFJBfNjKs01v8BRiXJjAc
	wI5xgxWA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Igz-0000000EXuH-3WwG
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 08:51:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JdLG3853708
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 08:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V81J0//aP7Eaf0ycXsuGgGwagnYfs3gvKKc6hSebF7A=; b=fRMRH1g8eb6sYlWz
	93awt4dhBu5vB5nlHMNwrYFixvGr2Sq9Txt1BlNrRyoFT09KEOGeWXUIPBF5aeb1
	uxSA7vlkEYF1+TGm13zg4/I1FsUhPAVbHZgbIzapgO71QsZo2GxZvMbN9BGJkSJu
	gV5Nsw7cBDYFyH0cVCSlv9+uNRMDs43Ed674G97FIelUf7fphDjS2zY+zTNfy/dI
	vJ4BrutFYw2gvjzY7xAA6BMKKLikH8c+5qR9cAw/UUOtgG9gGR+CEcV1ogv7OUeX
	NqvB/4l6skg2chbKpuUvjmaMbmSbgspMknXV77k8mIkgJDQfrA67KH9TMytu6l95
	EOIurQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3f2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 08:50:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86261e66700so509689b3a.3
        for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 01:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153459; x=1790758259; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V81J0//aP7Eaf0ycXsuGgGwagnYfs3gvKKc6hSebF7A=;
        b=NG16UtdpytkbvqHSmfybd9SrL/gVLi8ZvkQpnHk18gsg/c08FdHjq0L2GfpKlvRpQl
         oSvyiV4JYOEqP5OsJW3ubbcVmkZ3VsNFxCckNFfMrGyT60jNBVC7PEU/KYVkyuNmGDMn
         FCNZrGRR8sJRP2VR2WO34dIVxMgpKs5jPDz5nPaaK5aVKmUnfM8iUL/8VnwcIkKACqgM
         mtDsGpu+nRdVhXIXoYQjwz0c2gLoG+ZvCR7tNUOz4AjeMwQ7NkqmmXaxSjyvgnwRbIyf
         0BMdvds10sg4GTKLyoHleiEPa1PBL1vAFz1tw31UlXxyVqSRljHYgzWyi0MHrj9BrFav
         Cwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153459; x=1790758259;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V81J0//aP7Eaf0ycXsuGgGwagnYfs3gvKKc6hSebF7A=;
        b=mSLwmzm4NehMhBR3zJNqSvHWu+wK920AQaQfTpxuqkqAndZN5tJn+5+gQ75HXHHe2m
         N9gLix77x1U5/wvAZMymgXGB8CdeFKWux2k93GoO+iztJC9xKjLQJVwG1shDOGC7mLv9
         0akTVcaBIFi5f9B+K3R2kfrzO6LwaRlnYvoTPS83vb5rr4PsUUZW7XPRJFGtUn5EFrcQ
         mME/FjXh20rPNpcxTGHCiaeihemXq4jWyKrNI9ueusUj0w1V9w3knovF4iFnLlVLe4Zc
         bOBN9cvz0qLN8cYLyWjziJcfcYe4WzoMyCDRgBOTLkBSoOUUiHgXaOe0R7G9s7qNA9fc
         GYLw==
X-Forwarded-Encrypted: i=1; AKwUvBykMvlTwY7OIW9gg184EUY4fRX+ycsjKwgiAajEwT91qhxxupUi6uMM9wjo8RYRZXn7kINVrfo=@lists.infradead.org
X-Gm-Message-State: AFuF++maZrldd+sCF2WjjIKstuene7G54z9xsO0S7EGGDyh8DLL93vhd
	RUThtIgvOQHr+Uku2/VwEX9cDeAfePG/KvLNBK90uTKUAJe/U/NCpGWJvYiJ93rkFQdMmR2g2RT
	7AYHYzKJOXyaoAaqfemCXVhmYA8T7vdKYjxe4xVU3Fm0MFHRLRvCWE5C7abuO2WtC
X-Gm-Gg: AYBFou27Y9EX1DmmKdjnAoPFbYRgdCeKTgU1TJpuLtsi5u/4pbrPvzaDCuGo6F92s4Q
	gNkm6QFSp6E5iXPFeU8+QpiCugJ+5lIdOHx/jdbVSOkiDhXWNVQSRBkms7EYeTJrJKOafgc+z4H
	39jiHjEHh6+8FTcVb/RdkiU/riA4JEIuatf0CmIRkbuLEnNs7PQN8jfw1uTpE6MMXPStGfhMfYY
	X2m/v7GRBlzSYRjasWLTqJOjnjKIcvN0Z3TEENF/DWb0dWGu1AH5HHtpd11h7S4WEUsQ+fq/WM+
	hmHuQBc3W+5c1VqCknY/JRVkpFjma+FPhUuToMWaNlFRN7sbG5HuW3CHw/IXjdWAZXNvqIcQaFE
	wP2QIQCN6TaJJ4HtBxz1f7oyBEMm6Cp9egndXi6OURSJ8JyezpBfMEj5/8pkQCalk6JNsJshC
X-Received: by 2002:a05:6a00:3318:b0:857:73e2:9106 with SMTP id d2e1a72fcca58-87d1b3ace7amr2110665b3a.22.1790153459096;
        Wed, 23 Sep 2026 01:50:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3318:b0:857:73e2:9106 with SMTP id d2e1a72fcca58-87d1b3ace7amr2110650b3a.22.1790153458595;
        Wed, 23 Sep 2026 01:50:58 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfbfd11sm944539b3a.11.2026.09.23.01.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:50:58 -0700 (PDT)
Message-ID: <16ac8645-3aa9-43da-bcc4-9ecb2225e1f2@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:50:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kang.yang@oss.qualcomm.com
References: <20260922200643.1133491-2-ivitro@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260922200643.1133491-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX/AcSI22expfC
 Cz6Ep3uJJP8uc99ryzx245oY4vKIh422oY6pxa9fh1bEfHk/AkU/kOgIUjvvKg29RCNSSYRKxOA
 fm5UqVAIjpwnPzidJr83EINNL7jEeENp22h3SR0lLa600VFfNG015YGvrQYu5VyDxiqluKaEw6F
 6S7wo4Zf51PXU82TJ9f0CNxDZAii6q/OmMGSF0+5qefeKdjp7aWCmh7L61f8gF5Sko8Y2wLzRZh
 W3WXrDTZzkivSL2Vu/SOx6zKN47b7oMys+UxXbmRKyIAKWEtOWw/hll3f0gIRoeK1VGwcFqORHV
 RGOVIm9S8+dIQ+ClTLvSWFMvwSR6zW3WfM0SSOnAS2W1rZp8lcLuW/jWtUV1W/10yO0lOAbbu0M
 bKmFQMJY5JjIKHEGY4pCs0ItHtYgamh8xKbNOUb/endsAlbiL27D2EEV8CZ4D1E1fUrL4ENvRyj
 yebm3/cvDY0b1tNOI/g==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab392f3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8 a=PJUtwoy5LLMsS-UO4yUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: trtMXYLt-bF5LC_6fRNfQ_ap_e_sWTbt
X-Proofpoint-GUID: trtMXYLt-bF5LC_6fRNfQ_ap_e_sWTbt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX3XUzmXL1556E
 PCEsoZ/9WuOD7OJTKQgz0H520/4HVigQVDL3wrV+opOyjPD4vOfylbvM3RuLjJfpb8vnLmMUB8R
 0d/78sUN47f+VHEcIgm+w9bH9ClRz0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_095110_039744_FF001195 
X-CRM114-Status: GOOD (  15.89  )
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



On 9/23/2026 4:06 AM, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> ath12k supports creating vdevs with addresses provided by mac80211.
> Userspace can already make concurrent interfaces work by explicitly
> assigning different locally administered addresses.
> 
> However, ath12k does not advertise an address list, so when a second
> interface is created without an explicit address, mac80211 has nothing
> to pick from and falls back to the permanent address. If the first
> interface is already running with that address, bringing up the second
> one fails with -ENOTUNIQ.
> 
> As in ath11k, provide a list of usable addresses so
> ieee80211_assign_perm_addr() can hand each new interface an unused one.
> Keep the first entry as the wiphy's permanent MAC address. Generate the
> remaining entries as locally administered variants by changing only the
> upper nibble of the first octet, which naturally limits the pool to 16
> unique addresses.
> 
> The cfg80211 definition of wiphy->addresses does not specify where the
> addresses must come from. Some ath12k platforms use it as an interface
> MAC address pool, while others use it for firmware-provided per-radio
> addresses. Gate the generated address pool behind
> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072. The flag
> is read from the first radio, as all radios behind a wiphy are
> expected to have the same setting.
> 
> Other platforms keep the existing behavior.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


