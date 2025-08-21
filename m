Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE07DCA0EEB
	for <ath12k@archiver.kernel.org>; Fri, 22 Aug 2025 03:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqD/G4DiNMLiTCkTA2J/AtCk9WkGGGg4vKtplnX6Cn4=; b=ol4f3tIOqGyyCGawRjNDCTTvZ2
	Ap//lJtU+800M3jjT5pf9U7jXeNrl6NI/w4ZJ4R84MJ9KDjNffzRJ8gsJG1IVBzBsky0Ym1rxCJDm
	DuVq4Z9ibkQe+RSMoSSSQApvJbtEqxblhKKP8BPsvKf0ZtFVZB2DJeZRfoQEsN45VPwyJ9ZO4qWNJ
	x2ffA6gbjAKwpawXcbBp607kRMfW6bvJeIqRmXJGM71fTfMEm2oFwBDzH5WGq3L4OkhY2kuQ0y4fW
	tVJTBHeNkwcpwjNXvIL62rIQDdXjkzK4eftwA+jTrddfny5FwEBF3z11phKsV3sj7dx+5i1itYX3h
	Hi9GpGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIlK-00000001RB2-2zxO;
	Fri, 22 Aug 2025 03:48:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEzl-00000000xdl-1i1S
	for ath12k@lists.infradead.org;
	Thu, 21 Aug 2025 23:47:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9JGG012715
	for <ath12k@lists.infradead.org>; Thu, 21 Aug 2025 23:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqD/G4DiNMLiTCkTA2J/AtCk9WkGGGg4vKtplnX6Cn4=; b=l6JskNmSncuMTyWR
	p4fwEXL5K77kaonZBtE4lJWFT8g3W+1FaDQFqSjlXYgBY/Ypitl3ni0gQpq4tTui
	F+xpcTSRSK0viTj2r3EF6wMvx3M/sqP4sq28pfuw9mIYJ3rZ79fXPWUefP1lO9c5
	HqRBNiLI4i6735ldO/hKw9KWgMNGr4R8KEQmDtvBmtKnsU6DH1U2C/C9nw29VlwF
	HwCbcsfFJZqzEW7Pw9mf69AxoBZSind/Bz72doXs6dOkzjuvoXc5jrMFqdt4Jp25
	xdyDpREFPi1gY1myblE9jl9zFdhsbbaioNzcvMu3vClRaslNBjSG8sA1F5fVScYf
	J1vhjA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dq3ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 21 Aug 2025 23:46:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47175d5a90so1262171a12.3
        for <ath12k@lists.infradead.org>; Thu, 21 Aug 2025 16:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755820018; x=1756424818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqD/G4DiNMLiTCkTA2J/AtCk9WkGGGg4vKtplnX6Cn4=;
        b=JhUajvYN6L2+EEPPGxuNJ62ZISz6ldIeqzUH1dlF8YCTjjLN9FXQiD0HpRHeYrLUYj
         L81lOkP4NXpHBt/H1x9JCogVRM3l4RlTS/5KzhbMgdgUigT9Prm4kp6s0psuW0tVYgv/
         azd636AWHvj8eRSNVf8SmnZfCEjuygc86p5AeNxlE9a5RbwGb9qi5yE5nDkI9YqwG2yL
         ceEpjr1C0MoeEDWr6DUnMTvd3duxVrUB08ALenqyK3saKAa5MlbSWNOY8N1WZLDVMt0B
         wctd3+/DWRVnOVAL0C7EzoTqSOS2nEREBxy2azGABvKG7gCFvXEvqMycP5lGs+g/RXjv
         fubA==
X-Forwarded-Encrypted: i=1; AJvYcCWC5NPyGf7uH5BQaGPoUOdZ1II8JHqPPBCixU/mbF7ONd7cyKlfkxUu9g6MHEjSFsgwpKH36Bg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQMX7TVsVVLT3KsFQV4/KOeNIvrFudi0kljqJCpkMTXWmycQpP
	mwIjTnrmQ/DH39WcqEGw7pf4T/05F3o5LxUM76RQPCWiqpKT0BqUhjgecZK8n08rRkdLOdizSeK
	pe+aQkF4qTKCCJRLcjbf9mshO4LXlZLn+KLhh1bvqj1bJ2Vv/x1bDlj6Z2lgNpBP7BB33Pp94
X-Gm-Gg: ASbGncu0HK6UWmkgAGWg1gxi1pXy28T7juvQQF9ikbgtd0MlxPzYQYx84J1JoI+vI9Q
	70WTxd9nS19DofOxR4WEu+HqhRHpT4mvUHmbQCe7SnBU9ElO3rl44xLHTeJRaWpZ4mITs6pFvDM
	QnWXCivg+hZrIrZW23b3UCmDT4IoLHOMOJSOf2l1q+2y+pa06IRz5IDH4FhTZQHnb2BrDwkNfbl
	tmLX3v84MPoH8ZX8IItul/l8OBL1aKGzNQBhJh/46QqHnQuDZEzuIGyMJvtk/6Umjau587bubfu
	KzLJcy+PEdOmJqs9qqXbiKA9z6f+VBxOUdnqFUBI1uG7zskLsHUXANIbs2tkT3impt+Iv+A3ZsX
	qF08h3d+Y0YzV6J6lCqOu5ijIbJAEcXDg
X-Received: by 2002:a05:6a21:6da2:b0:23e:19fd:e182 with SMTP id adf61e73a8af0-24340b18985mr1349959637.13.1755820017744;
        Thu, 21 Aug 2025 16:46:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF56u0gYtkNhznPrjAd7iNBcPBSkS3ViNztM2dnXvdpgRAEfa8Jp2IFuzQ0ibSAil4yHiaDBg==
X-Received: by 2002:a05:6a21:6da2:b0:23e:19fd:e182 with SMTP id adf61e73a8af0-24340b18985mr1349932637.13.1755820017205;
        Thu, 21 Aug 2025 16:46:57 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d39e1sm9305787b3a.20.2025.08.21.16.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 16:46:56 -0700 (PDT)
Message-ID: <bfb8fb5c-ac92-4ebc-8cb6-c46ac2751418@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 16:46:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: The whole computer hard resets when trying to load ath12k driver
 in a KVM VM
To: Nazar Mokrynskyi <nazar@mokrynskyi.com>, ath12k@lists.infradead.org
References: <1bd351ec-1ed9-4a01-aae5-0ceb17fbffce@mokrynskyi.com>
 <71416eb9-d313-48de-86b1-40e8044b4076@mokrynskyi.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <71416eb9-d313-48de-86b1-40e8044b4076@mokrynskyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1OXFWe0PpphT
 Zvq3N2qNhhEiWwDDmngYuwi01lGRSwIiHVfOJHlYIcAf4QvIDA12Ekt2lkFCK8AzDTGNRh8gCa9
 6BKiZNqGrH+gupoHIiquEltHVkRKU3nMqMCM8eItzNihQXbOa5DZdZwCYdmOXBTLXbom3U87pn+
 Und26LWwLnt/k0iwJklkZx6tqcFqVFLZwaNHUhsgSjyNgTmOgsGobRRHVjgNdAZj9G34PFI0my6
 CAdhLi7CCevZZj3GnmI0czSShwzJ2q1D6R9UOrT3W2stFZbBFpeHZMvd4oAqxWy11ba+1UIs8qE
 B886CkWdQNQmdtWvBeMWs3jho+VC5BtnnMVu7fJ/7t9wVMm5QDXrBzDVB5yZFA0bjFkcx5jV+fT
 I6hWSUz4zjlzym7NIXVte5cRjGRa1A==
X-Proofpoint-ORIG-GUID: 6sNYE30q7zPd2NWIceBqOCcI7nSGjCfw
X-Proofpoint-GUID: 6sNYE30q7zPd2NWIceBqOCcI7nSGjCfw
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a7aff3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=pFaJOWOTKGEeXdac:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=jdP34snFAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=ol4nOC8PNhphcZ5N9AoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=jlphF6vWLdwq7oh3TaWq:22 a=TjNXssC_j7lpFel5tvFf:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_164701_567742_B1ACE0E7 
X-CRM114-Status: GOOD (  22.34  )
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

On 8/20/2025 2:47 PM, Nazar Mokrynskyi wrote:
> Some additional details.
> 
> The system is x86-64: Gigabyte MZ32-AR0 Rev 1.0 motherboard (with M23_R40 BIOS) and AMD Epyc 7302P CPU.
> 
> Host OS is Ubuntu 24.04 with HWE kernel 6.14.
> 
> As guest:
> * initially tried OpenWrt 24.10.2 with kernel 6.6.93, WiFi backports seem to be from 6.12.6
> * then tried the latest snapshot (r30806-070d8eb4d5), which uses 6.12.40 kernel and according to the kernel module version carries WiFi backports from 6.16
> 
>> # lspci -mnn -s 46:00.0
>> 46:00.0 "Network controller [0280]" "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]" -r01 -p00 "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]"
> The module is QCN9274 2x2 5G+6G from Commtek (but missing on their website) with M.2 E-key connector.
> Looks very similar to Compex WLW7002E56 in terms of size and features.
> 
> This should be most of the details that might be relevant.
> 
> Sincerely, Nazar Mokrynskyi
> github.com/nazar-pc
> 
> 21.08.25 00:15, Nazar Mokrynskyi:
>> Hi,
>>
>> I have a QCN9274-based Wi-Fi module that I want to use with OpenWrt under KVM VM (libvirtd, vfio).
>> I used various Qualcomm modules this way with ath10k and ath11k in the past successfully, but ath12k seems to be buggy.
>>
>> Two cases:
>> * if host already loaded ath12k, then starting a VM with the PCIe device passthrough triggers immediate hard reset of the machine
>> * if I bind the device to vfio-pci on the host, I can boot the VM, but it inevitably hard resets the machine when ath12k starts loading (presence of the correct board file does not matter, it doesn't seem reach that stage)
>>
>> In the second case, which I'm primarily interested in, the the following lines are the only thing I can capture before host hard resets:
>>
>>> 0000:01:00.0: MSI vectors: 1
>>> 0000:01:00.0: Hardware name: qcn9274 hw2.0
>> And when machine reboots, BIOS prints:
>>> Warning: PCI-Express PERR/SERR error detected.
>> I'm not really sure what this is, but I think it should be trivial to reproduce.
>> Looks like either driver or onboard firmware issue?
>> Open to do more testing and provide additional info.
>>
>> All information I have so far is on the forum here: https://forum.openwrt.org/t/qcn9274-crashes-the-system-during-driver-load/239491?u=nazar-pc

Curious how you managed to get this to work in the past with ath11k since that
is not supported. Some discussions on ath11k here:

https://bugzilla.kernel.org/show_bug.cgi?id=216055
https://lore.kernel.org/all/fc6bd06f-d52b-4dee-ab1b-4bb845cc0b95@quicinc.com/

