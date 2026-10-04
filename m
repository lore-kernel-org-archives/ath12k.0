Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0F8CA5FEC
	for <ath12k@archiver.kernel.org>; Sun,  4 Oct 2026 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWhCgVGXv8fnJdT9/T5h6M5vyvD9nlGok0X53QPksxs=; b=4/uvVIWoYrAun00jJNbowpPE7f
	sT9ET8cGWzzxxOYQnbqtIZA4xa0r4wvADQTbIgL3kzUiXX60fQmwr1grso/sadekFZlACrWEj8Rxh
	GyaoTM7RDGHwyBmWSyeSk11r5MJAUuogZi7r9CNOHzFhRYfm46XA4/6kxE+JXURQJyhkixnYyyQkA
	jKOCI+DQ4p61xkyc4iO3UHjm36PHhV7JgaPNjufrfpFOs223bAKnqSm3HAR8HAiOTinFs5ywFixc4
	NSMrlztTR0oboJUhTRca+Mn5aTOQSmLO6OPKMjrUW4dyT9DzHy0rizDQgIPMLD/2m38tVFKQFV2sv
	ubbFHLtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDIcX-0000000Ecbw-20vy;
	Sun, 04 Oct 2026 09:35:01 +0000
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDIcU-0000000Ecax-2WKF
	for ath12k@lists.infradead.org;
	Sun, 04 Oct 2026 09:34:59 +0000
Received: by mail-pj2-x2a.google.com with SMTP id d9443c01a7336-2e2da4743b0so1471035ad.1
        for <ath12k@lists.infradead.org>; Sun, 04 Oct 2026 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106497; x=1791711297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWhCgVGXv8fnJdT9/T5h6M5vyvD9nlGok0X53QPksxs=;
        b=IaYouLEohOhl0VQTTjHXEJeyU+pLB7BxYLBLk0exLF1jGUmZwmhjPhun8hPbDAf4QI
         etZZ18makXHyaJKSE/tgYyQUcv0L0YqJxFKJjg3v+fXdT35I7UBmll1zvETWnIPI7TWJ
         B+nfSUlL+ZeklcdvFNtM7Mhxrm92OOTIS4CHsBysHjgw1pDWVjzVolO8m8qGqkcU6GuK
         2xijlLzI40xEWiaDbDkAs7ptk18JXUoTpYP5sJDATlWX2EDcVnkm0ExDelCkawCbhlwr
         Ml+dTCqEe58ZjkIDOUrwhcOkLOrprpW8QtrIBONBBTjgvLRGWqQjBDXDLhcFAyfvOkcw
         GJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106497; x=1791711297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWhCgVGXv8fnJdT9/T5h6M5vyvD9nlGok0X53QPksxs=;
        b=tqJVuAV2kAELaBBd3Fr4ZT+M3p45gDAJZbIYz0EZTqDl61+W4cEBZKBxHnM1NEd3aF
         r96xLwV1/bnAMtHJlDuSdsEsQYpFzWOC0ZxmTFD1a0LJHl0GI/6GS2wIiAgpFGTDO9tN
         MwUka849XjoLXIw2wli5cbrISIhKMo0pJMVuK+/wnPn3kOCgkAVD0s1Y5pg98xOXga5E
         Dw0fbmonMOR/g4E0wlywyX3mmseq0Ro3Y1oszWU+X498vq1g16vcABSC0zlCXBKfoSbR
         IXQO/CJIVOag9WCYSkssF0ac6SWrs4M3PQwDWThKei+9OPUCl+vBUz2vj7OLkPV8lTu2
         t2Og==
X-Forwarded-Encrypted: i=1; AKwUvBwHFOM8dHmr5FKKCXfUXKxg4OVaFD8IozaiMNGnq12J6Gp0a/urR3f10fZOEWFEZm8FwtI520Q=@lists.infradead.org
X-Gm-Message-State: AFuF++lF7hw1Wni0x8EB1OErryG3K0VI43ZCvnD5yzmFVisM0HlqEQHu
	HZ3tHq0Kspou2DeAd0uyh0KzH61GSciu1xh5XMZ/7lTMHR67kJQ3fqt3
X-Gm-Gg: AYBFou2G+LOCEmnDX9Ctw3pJ54IJNZDLwBK96OEpS3804+ePv5Cd14e7dNmPl0JBr6U
	eGgAazY3Q+G+C9sRoM1MchYK/9+fRyuQIPqFOV7t4VIdgTgOgmNdREXVQTCEHXwHKqhjUx0OIKg
	YKmsUYU3gcXf98kztEv9VeDqDwO9AZ6g+2IKZbsJm8UtXq0+EsoEtiH83S50q47vMK88NAAmMUj
	6fQ0EideFoRd1lzHHsgF4j7m5fW4W+r1V5XacIV0+RcCmdEo9XG5O3qN0NOaZmplfVhANR+45Z4
	ch9uyDLcRs2/PEVNIYIgZfBV6+B4FdZDGlxYZfwQGYbsfdNPHH8oMMV43ZLJBrUKMTh5wCXRUzK
	VuWMIFatIRUPL7/ztHM29TQgEKBurHkSZSE1uaKKZLcWuyzQ+B+pFgB9zfVz+ovFSuGr/Rgm9Ek
	aIok3Y7aJIf0vWEuas7jRruQekulLBRqp0fv74Jwc2ql8E4tIgdE00ZOTm4Sl965mrcibIfUH9u
	CXBJFqNmyuOHA==
X-Received: by 2002:a05:6a00:4303:b0:886:95df:c50c with SMTP id d2e1a72fcca58-88af6c2b913mr4662570b3a.26.1791106497501;
        Sun, 04 Oct 2026 02:34:57 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c980833sm2384121b3a.43.2026.10.04.02.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:34:57 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	yintang@qti.qualcomm.com,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>
Subject: Re: [PATCH ath-next] Revert "wifi: ath12k: add panic handler"
Date: Sun,  4 Oct 2026 18:34:56 +0900
Message-ID: <20261004093456.74263-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
References: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_023458_645307_F98D1354 
X-CRM114-Status: UNSURE (   6.77  )
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

On Thu, Jun 11, 2026 at 08:23:32PM -0700, Yingying Tang wrote:
> ath12k_core_panic_handler() is invoked via atomic_notifier_call_chain(),
> which runs inside an RCU read-side critical section.

I hit this on a WCN7860 (hw2.0, PCI) in a Lenovo Legion Tab Y700 Gen 5
(Kaanapali), v7.3-rc4 plus board patches. Here the panic never got past
the notifier:

  SMP: stopping secondary CPUs
  Voluntary context switch within RCU read-side critical section!
   schedule_timeout
   __mhi_device_get_sync
   ath12k_wifi7_pci_bus_wake_up
   ath12k_pci_read32
   ath12k_pci_sw_reset
   ath12k_pci_panic_handler
   atomic_notifier_call_chain
   vpanic

A hung_task panic stayed hung until a forced restart, and a sysrq crash
only ended in a reset after about 50 s.

With the handler removed, a sysrq crash reboots normally, and after the
reboot WCN7860 is enumerated again (PCIe Gen3 x2 link up) and Wi-Fi
works.

Tested-by: Joonhoe Kim <26rote@gmail.com>

On Baochen's question, the handler came in with 809055628bce, so:
Fixes: 809055628bce ("wifi: ath12k: add panic handler")

