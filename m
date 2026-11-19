Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA5D606A337
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mtjgoDeC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggvS9+gw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=; b=mtjgoDeCYJGxYj
	TZftBBs80C8X7VJ8YV1U6t75MAP+/YCeyUd+h2eq0EG3Y842iMQM1X++VKF7VKX2iS20ooI79sB9N
	623e/4VObc8vjKlr8zkvvNXHD5p1CusQ71np3wJiwgHUVzcK0Sz1nf1Qxil46wsWDHWdw+8nV2PKN
	DZJ6biIH+o071K3bGOuhDr9AEAjKpHjYJd4D+TPLH3zZFLS+ZLtOscvqDNrrD1t+YUGZ4TyUPBSdw
	VQHwBtO9YC3J0Pm69hkHIIyunS3S7QtDsYa9di+m+V0V+VEolBop9VoU2FTfB2LuqpMJvPcbQtNUB
	u/moPpaFP/3rjlUinMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU33H-0000000CDOI-2SQ8;
	Thu, 19 Nov 2026 14:23:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU33F-0000000CDNY-1EPE
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 14:23:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2efd7259872so13749735ad.2
        for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 06:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098228; x=1795703028; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
        b=ggvS9+gwauQch8NSrRjweTb16v9N1zVXDs3GJbP06BucbZeH5sFtkaiy1XE3OZgDcp
         9Fq/q/cmuLxcG8sqk4e+y4yLJWJMUegSUwHv+SoY7bSe//hJI51EJaC7DRzp6g72KdCr
         9dy+XhJAp5CNPIUSoU86PyQa818rQ8OQFW2BEad9BYzHIpLgerhA9b2K3e30zOBbtHy7
         ey04g+N7LMyFHLwsB428VUNiUqbUd8I0bqYMPu6Rn3b9TiRzJ8qOUKIrxkqPoix06T+B
         L35XZ9NIRkkrUMPzYEt7XR1IvXLUASE5RSjYStyo1WKyCH25B1rZmC5/NTUZ935MxCT+
         7MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098228; x=1795703028;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
        b=BoaMH5iM8Pi8nLgS5o2ncbzM3l4lofBtTxZvTmVfBJLwPsugG/4pTltn085VSQfjML
         OLOpJ9+lPQkEZ5P8O/gL/u6/rAM1mpnREjR9H95qL+VZN3qH92C/LT51t4Frsr+DlTHS
         KRS6sVQDoARcpnvJmPgRHpHG/Ete110RAvoxB01sEALpIinPFTBLEQ0vFtZLveYgS1OP
         jZYSLUpojucVXsYArN+H4qeso2QeyePQ1A7eox93HH5dNY/WMZMJqxk3rf/x5fg133Yk
         1207ab2L+OvCXaQk/8klMC72OumbHlWxvAVTnXdONOonHBvu9KMx/Sm484O5QBzyQ8/B
         a/CQ==
X-Forwarded-Encrypted: i=1; AL+hErEFq9dGWT7PbarYJVdEAYV0zlhI2S/Gjq3OWWAdEhNLiSimzQFWfzQRXPAYwE9NHQBdE4/yEm4=@lists.infradead.org
X-Gm-Message-State: APuU4Z97q4dU5BApCbsXbXp2/SaqrNA5ix91r/DRxAFfyOJvi7bPBjSX
	KlLLjoLRo3/M0yMiFqRoO2ak+aELZLwZEOQvXvaoR+PP+U+jhOs/LQPY
X-Gm-Gg: AZFdTZdIg53AU9t2WQC/8Q4b8nVwCp4LhTqkqc83/SIVFw89WWtn5GlVTZZC/TDK5Ks
	WvVOFumiQwJUpepjfotJ4h3Ir0fHr7PSj7xCiAGphuj3C2dJNITxv87zDkSwtoh/k4NtPE1vSkP
	KsCg0JI7UtFX9aEfjEsK8L1FwOUIqVWFG8cguqQ1gC09ADaP3rPcnqBKqppDOeFCUBNTf756haq
	pEIyGs5hheyLCzc73zjpJumwdNmG7KXJhg6NXLtv/wt1Kp5DwR7fW9or2HU1JGmeKzuGxgtDQOS
	z3a/iK0Xy60Znb443RZJeVRyH2FWuItAh1iqIslXmLlDV6o2UomANTZPUnBsuE6uG/z6KmzcGit
	4p5q1w8nGIP1oG8DMOdfFVYVV3n0JyfwG84NstPiWlxhBXNVFFEqnRdql4c6eljTtmGmGpdPuzN
	PcqsOL/aefsGu1SudD7X+GHBwIHcW8II6ErpzUrGtFw5khPKvLKFCJJ8QTd+zwNO3yubYLiGEQ6
	cjlMPgEw8SpY/MX0Ff94h6Sqq+zUzGEdUAMkrQ5IgJ6o8mxGqlXwnwoeZDVW/c+IuiB/rJ52ivO
	2FdHsKSV12sDOdHKT6h0Gz6Ghxh0pWXP9Xo=
X-Received: by 2002:a17:903:244f:b0:2ef:ee39:5dbb with SMTP id d9443c01a7336-2eff754e579mr60705635ad.61.1795098228295;
        Thu, 19 Nov 2026 06:23:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10e67csm164415ad.53.2026.11.19.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:23:47 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH RFC 4/5] wifi: ath12k: Support MAC address from the firmware node
Date: Thu, 19 Nov 2026 23:23:41 +0900
Message-ID: <20261119142342.2063-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com> <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_062349_336277_D95A30FA 
X-CRM114-Status: GOOD (  12.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 14 Oct 2026, Abel Vesa wrote:
> Read a MAC address from the device's firmware node (a DT "mac-address"/
> "local-mac-address" property, or an nvmem cell named "mac-address" via
> device_get_mac_address()), and use it in preference to the address from
> the firmware board data.

Another user for this: the Lenovo Y700 Gen 5 tablet (TB323FU,
Kaanapali) has a WCN7860 on PCIe, and its firmware reports a new
00:03:7f:xx:xx:xx address in the WMI ready event on every boot. Network
profiles bound to the permanent address stop matching after a restart.
The factory address is only in a file on the Android persist partition,
which the vendor stack passes to the firmware over QMI, and the
bootloader puts no address in the device tree. So on this board a fixed
local-mac-address is only good for testing; a per-device source would
still be needed.

I tested this patch on v7.3 with three changes for Sashiko's review [1]:
the return value of device_get_mac_address() decides whether the
address is used, the buffer is __aligned(2), and with more than one
radio SET_IEEE80211_PERM_ADDR() also takes the firmware node address
instead of ab->mac_addr. With local-mac-address in the wifi@0 node, the
permanent address came from it and Wi-Fi connected as before.

The cover letter says this patch is only an illustration. Do you plan
to send it on its own? If so, with those changes (and the comments
dropped as Paul asked), feel free to add:

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (WCN7860)

qcom,ath12k.yaml has additionalProperties: false, so it would need to
allow nvmem-cells/nvmem-cell-names (as used in 5/5) and
local-mac-address/mac-address as well.

[1] https://lore.kernel.org/all/sashiko-outbox-171329@kernel.org/

Thanks,
Joonhoe Kim

