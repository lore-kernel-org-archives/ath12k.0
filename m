Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBF9C4167B
	for <ath12k@archiver.kernel.org>; Thu, 30 Nov 2023 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TW0yv/PGaTGqrP1Poi64Z6y6JL1ukRdcf5BV+zDPH2w=; b=JirPNbnuUOkqEi7lkeaiYJ5mN+
	dPhYROLemMXWynyhYirlZRsfzedrWiFl+8yMcxWkWrZn6PEJMa2VE9LwTe8ClVVic7HXmV9U1I7BM
	nnXiljvp+5HhaORmQeQmtFzwJ9MIa9Ho/kl1hasIv5KTM1NVD4q3G4Q+5pg6BellM5h8ZUcZvwieT
	l1AF+Ap9svQlu7eD7K9tXaBA1n7aL7qVQxFt/dXdlrloerLKBxQ1Sa3qtHNNMwSjKcPtgezzrGImU
	+yYTaFNQMS2VYQjIvbwKQIFJEsvVWD+nCKvnS42Tey3lhn9izdtP05vE9H2edUB8LKCe9Oex94G1o
	mp2Su+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kmP-00BUpw-37
	for ath12k@archiver.kernel.org;
	Thu, 30 Nov 2023 17:24:49 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.183])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kmM-00BUoA-0b
	for ath12k@lists.infradead.org;
	Thu, 30 Nov 2023 17:24:47 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 4E4AB180069;
	Thu, 30 Nov 2023 17:24:41 +0000 (UTC)
Received: from [192.168.100.159] (50-251-239-81-static.hfc.comcastbusiness.net [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id A20B113C2B0;
	Thu, 30 Nov 2023 09:24:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com A20B113C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1701365080;
	bh=KyGZpc3OXOoFISDA/b8f0lEFj8OxM+oTFMAeeUv4P2s=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=k9ZaE0+fVL+UJYeHKO7kxBhEeUSOsKeaeyNRitYEaQ6gFtvVXlpA2Qy0MDKKYiNIO
	 uBnUcp9xCdTnDhO1t/ezZ4Mz+9i2z2fk1EsURlfaSnVDxFjWGZyDA3OIFbyd2V81/S
	 9xGfCPQO6cVtQgZXYMUVLGqf9nIUMw7IFZVEKSaw=
Message-ID: <c7867645-6d35-3691-f505-54026a655e13@candelatech.com>
Date: Thu, 30 Nov 2023 09:24:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Firmware for qcn9274?
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org
References: <864419c3-71e1-49e8-40e1-88bfafba26f4@candelatech.com>
 <bcc2a41e-0d5c-46b2-acbc-fa0f22c55232@quicinc.com>
 <b48f1931-7844-9dd9-7668-0e553385afdf@candelatech.com>
 <dac4b5df-80e6-4ba9-8612-b840f9536a18@quicinc.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <dac4b5df-80e6-4ba9-8612-b840f9536a18@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1701365082-UAEP_yPOqqWV
X-MDID-O: us5;at1;1701365082;UAEP_yPOqqWV;<greearb@candelatech.com>;6f229667a7254cdc88e13b408b211c59
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_092446_279166_C1503BA5 
X-CRM114-Status: GOOD (  12.82  )
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

On 11/30/23 08:31, Jeff Johnson wrote:
> On 11/30/2023 8:18 AM, Ben Greear wrote:
>> On 11/29/23 14:49, Jeff Johnson wrote:
>>> On 11/29/2023 9:39 AM, Ben Greear wrote:
>>>> Hello,
>>>>
>>>> Where are the ath12k firmware binaries located?  I don't see any ath12k tree
>>>> in linux-firmware, for instance.
>>>>
>>>> ]# dmesg|grep ath12
>>>> [   55.381104] ath12k_pci 0000:0e:00.0: BAR 0: assigned [mem 0xdf000000-0xdf1fffff 64bit]
>>>> [   55.415662] ath12k_pci 0000:0e:00.0: Hardware name: qcn9274 hw2.0
>>>> [   55.592167] mhi mhi0: Direct firmware load for ath12k/QCN9274/hw2.0/amss.bin failed with error -2
>>>>
>>>> Thanks,
>>>> Ben
>>>>
>>> See if this helps
>>> https://wireless.wiki.kernel.org/en/users/drivers/ath12k/installation
>>>
>>
>> It got me closer, but the ath11k-firmware directory tree has different path than what the driver expects.
>>
>> [greearb@v-f34-64 firmware]$ find . -name amss.bin -print
>> ./ath12k/QCN9274/hw2.0/WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1/amss.bin
>> ./ath12k/QCN9274/hw2.0/WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1/amss.bin
>> ./ath12k/WCN7850/hw2.0/WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4/amss.bin
>> ./ath11k/QCA6390/hw2.0/amss.bin
>> ./ath11k/WCN6855/hw2.0/amss.bin
>> ./ath11k/QCN9074/hw1.0/amss.bin
>>
>>
>> Which one of those QCAHKSWPL directories I use?
> 
> use WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Ok, that gets me a bit further.  This is a Compex radio, do I need to get a board file
from them?

# dmesg|grep ath12
[   11.190894] ath12k_pci 0000:0e:00.0: BAR 0: assigned [mem 0xdf000000-0xdf1fffff 64bit]
[   11.191078] ath12k_pci 0000:0e:00.0: Hardware name: qcn9274 hw2.0
[   11.974230] ath12k_pci 0000:0e:00.0: memory type 10 not supported
[   11.978913] ath12k_pci 0000:0e:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0x401a2200
[   11.978916] ath12k_pci 0000:0e:00.0: fw_version 0x1011001d fw_build_timestamp 2022-12-02 01:16 fw_build_id 
QC_IMAGE_VERSION_STRING=WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
[   11.986273] ath12k_pci 0000:0e:00.0: failed to fetch board data for bus=pci,qmi-chip-id=0,qmi-board-id=255 from ath12k/QCN9274/hw2.0/board-2.bin
[   11.998017] ath12k_pci 0000:0e:00.0: failed to fetch board-2.bin or board.bin from QCN9274/hw2.0
[   12.005582] ath12k_pci 0000:0e:00.0: qmi failed to load bdf:
[   12.005584] ath12k_pci 0000:0e:00.0: qmi failed to load board data file:-2

# md5sum /lib/firmware/ath12k/QCN9274/hw2.0/board-2.bin
a989bef1f212b8b4246d4e325000778e  /lib/firmware/ath12k/QCN9274/hw2.0/board-2.bin


And should I be concerned that the firmware build date is a full year old?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



